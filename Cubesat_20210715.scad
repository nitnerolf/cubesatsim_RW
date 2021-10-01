/////////////////////////////////////////
// 2U cubesat that can be printed
// on a 3d printer
/////////////////////////////////////////
    
$fn=36;
    
module header(pins, rows)
{
    color([0.15,0.15,0.15]) cube([2.54*pins,2.54*rows,2.54]);
      
    for(x=[0:pins-1],y=[0:rows-1])
        translate([x*2.54+(1.27+.6)/2,y*2.54+(1.27+.6)/2,-3.5]) cube([0.6,0.6,11.5]);
}
    
module stack(pins, rows)
{
    color([0.15,0.15,0.15])  translate([0,0,-13.5-2.54/2-0.1]) cube([2.54*pins,2.54*rows,13.5]);
      
    for(x=[0:pins-1],y=[0:rows-1])
        translate([x*2.54+(1.27+.6)/2,y*2.54+(1.27+.6)/2,-3.5]) cube([0.6,0.6,11.5]);
}
    
module female(pins, rows)
{
    color([0.15,0.15,0.15])  translate([0,0,-13.5-2.54/2-0.1]) cube([2.54*pins,2.54*rows,8.5]);
      
    for(x=[0:pins-1],y=[0:rows-1])
        translate([x*2.54+(1.27+.6)/2,y*2.54+(1.27+.6)/2,-6.5]) cube([0.6,0.6,3]);
}
    
module pi3()
{
    // PCB
    color("limegreen") difference()
    {
        hull()
        {
	    translate([-(85-6)/2,-(56-6)/2,0]) cylinder(r=3, h=1.4 );
	    translate([-(85-6)/2, (56-6)/2,0]) cylinder(r=3, h=1.4 );
	    translate([ (85-6)/2,-(56-6)/2,0]) cylinder(r=3, h=1.4 );
	    translate([ (85-6)/2, (56-6)/2,0]) cylinder(r=3, h=1.4 );
        }
        
        translate([-85/2+3.5,-49/2,-1]) cylinder(d=2.75, h=3);
        translate([-85/2+3.5, 49/2,-1]) cylinder(d=2.75, h=3);
        translate([58-85/2+3.5,-49/2,-1]) cylinder(d=2.75, h=3);
        translate([58-85/2+3.5, 49/2,-1]) cylinder(d=2.75, h=3);
    }
      
    // Header
    translate([3.5-85/2+29-10*2.54,49/2-2.54,1.4])
        header(20,2);
      
    translate([-85/2,-56/2,1.4])  
    {
        color("silver") 
        {
	    // Ethernet
	    translate([85-19,11.5-16/2,0]) cube([21,16,13.8]);
        
	    // USB
	    translate([85-15, 29-13/2,0]) cube([17,13,15.5]);
	    translate([85-15, 47-13/2,0]) cube([17,13,15.5]);
          
	    // micro USB
	    translate([10.6-8/2,-1.5,0]) cube([8,6,2.6]);
          
	    // HDMI
	    translate([32-15/2,-1.5,0]) cube([15,11.5,6.6]);
        }
        
        color("darkgrey") 
        {
	    // Audio
	    translate([53.5-7/2,-2,0]) 
	    {
		translate([0,2,0]) cube([7,13,5.6]);
		translate([7/2,0,5.6/2])rotate([-90,0,0]) cylinder(d=5.6,h=2);
	    }
        
	    // Display
	    translate([1.1,(49-22)/2,0]) cube([4,22,5.5]);
          
	    // Camera
	    translate([45-4/2,1.1,0]) cube([4,22,5.5]);
        }
        
        // Micro SD Card
        color("silver") translate([0,22,-2.9]) cube([13,14,1.5]);    
        color("darkgrey") translate([-2.4,23.5,-2.65]) cube([2.4,11,1]);
    }
}
    
module mopower(header=2)
{
      
    // Header
    /*translate([3.5-85/2+29-10*2.54,49/2-2.54,1.4])
      header(20,2);
    */
        
    hx=3.5-85/2+29-10*2.54;
    hy=49/2-2.54;
    hz=1.4;
    // Header
    if( header == 1)
        translate([hx,hy,hz])
	    header(20,2);
    if( header == -1)
        translate([hx,hy,hz])
	    mirror([0,0,1]) header(20,2);
    // Header
    if( header == 2)
        translate([hx,hy,hz])
	    stack(20,2);
    if( header == -2)
        translate([hx,hy,hz])
	    mirror([0,0,1]) stack(20,2);
      
    // PCB
    color("limegreen") difference()
    {
        hull()
        {
	    translate([-(85-6)/2,-(56-6)/2,0]) cylinder(r=3, h=1.4 );
	    translate([-(85-6)/2, (56-6)/2,0]) cylinder(r=3, h=1.4 );
	    translate([ (45-6)/2,-(56-6)/2,0]) cylinder(r=3, h=1.4 );
	    translate([ (45-6)/2, (56-6)/2,0]) cylinder(r=3, h=1.4 );
        }
        
        translate([-85/2+3.5,-49/2,-1]) cylinder(d=2.75, h=3);
        translate([-85/2+3.5, 49/2,-1]) cylinder(d=2.75, h=3);
        translate([58-85/2+3.5,-49/2,-1]) cylinder(d=2.75, h=3);
        translate([58-85/2+3.5, 49/2,-1]) cylinder(d=2.75, h=3);
    }
}
    
module filterboard(header=3)
{
      
    // Header
    /*translate([3.5-85/2+29-10*2.54,49/2-2.54,1.4])
      header(20,2);
    */
        
    hx=3.5-85/2+29-10*2.54;
    hy=49/2-2.54;
    hz=1.4;
    // Header
    if( header == 1)
        translate([hx,hy,hz])
	    header(20,2);
    if( header == -1)
        translate([hx,hy,hz])
	    mirror([0,0,1]) header(20,2);
    // Header
    if( header == 2)
        translate([hx,hy,hz])
	    stack(20,2);
    if( header == -2)
        translate([hx,hy,hz])
	    mirror([0,0,1]) stack(20,2);
    // Header
    if( header == 3)
        translate([hx,hy,hz])
	    female(20,2);
    if( header == -3)
        translate([hx,hy,hz])
	    mirror([0,0,1]) female(20,2);
      
    // PCB
    color("limegreen") 
	translate([-(85-6)/2+4,-(56-6)/2+34,-5])
	cube([35,20,1.4]);
      
    translate([5,0,0])
    {
	// filter PCB
	color("darkgrey") 
	    translate([-(85-6)/2+15,-(56-6)/2+24,-0])
	    cube([30,22,1.]);
      
	// filter shield
	color("silver") 
	    translate([-(85-6)/2+15+8,-(56-6)/2+24+3.5,-0])
	    cube([15,16,5.]);
      
	// filter connector
	color("gold") 
	    translate([-(85-6)/2+15+30,-(56-6)/2+24+8.,-3])
	    cube([1.5,6.5,6.5]);
	translate([-(85-6)/2+15+30+1.5,-(56-6)/2+24+8.+6.5/2,-3+6.5/2])
	    rotate([0,90,0])
	    cylinder(d=6.2,h=8);
    }
}
    
module fix_holes()
{
        
    translate([-85/2+3.5,-49/2,-1]) cylinder(d=3, h=30);
    translate([-85/2+3.5, 49/2,-1]) cylinder(d=3, h=30);
    translate([58-85/2+3.5,-49/2,-1]) cylinder(d=3, h=30);
    translate([58-85/2+3.5, 49/2,-1]) cylinder(d=3, h=30);
}
    
module solarpower(header=1)
{        
    hx=3.5-85/2+29-10*2.54;
    hy=49/2-2.54;
    hz=1.4;
    // Header
    if( header == 1)
        translate([hx,hy,hz])
	    header(20,2);
    if( header == -1)
        translate([hx,hy,hz])
	    mirror([0,0,1]) header(20,2);
    // Header
    if( header == 2)
        translate([hx,hy,hz])
	    stack(20,2);
    if( header == -2)
        translate([hx,hy,hz])
	    mirror([0,0,1]) stack(20,2);
    
    // PCB
    pcbx=70;
    pcby=77;
    ofx=-7;
    ofy=-3.5;
    hdiam=3;
    color("orange") difference()
    {
        hull()
        {
	    translate([-pcby/2+ofy+hdiam,-pcbx/2+ofx+hdiam,0]) cylinder(r=hdiam, h=1.4 );
	    translate([-pcby/2+ofy+hdiam, pcbx/2+ofx-hdiam,0]) cylinder(r=hdiam, h=1.4 );
	    translate([ pcby/2+ofy-hdiam,-pcbx/2+ofx+hdiam,0]) cylinder(r=hdiam, h=1.4 );
	    translate([ pcby/2+ofy-hdiam, pcbx/2+ofx-hdiam,0]) cylinder(r=hdiam, h=1.4 );
        }
        fix_holes();
    }
      
    // alim header
    color([0.15,0.15,0.15]) translate([21,-36,1.4]) cube([14,9,10]);
      
    

    color("lightgrey") translate([29,16,4]) import("C:/Users/fmillour/Desktop/3.5mm_Headpone_Jack.stl");


    
    // Solar boards headers
      
    for(xi=[0:5])
    {
        translate([14-9*xi,-35,-4.5])
	    mirror([0,0,1]) female(1,6);
    }
}
module rpi_camera() {
     color("darkblue")
	  difference() {
	  cube([24,25,1]);
	  translate([2,2,-1]) cylinder(d=2,h=3,$fn=8);
	  translate([2,23,-1]) cylinder(d=2,h=3,$fn=8);
	  translate([14.5,2,-1]) cylinder(d=2,h=3,$fn=8);
	  translate([14.5,23,-1]) cylinder(d=2,h=3,$fn=8);
     }
     color("DimGray") union() {
	  translate([10.25,8.5,1]) cube([8,8,3.25]);
	  translate([10.25+4,12.5,1+3.25]) cylinder(d=7.5,h=1,$fn=16);
	  translate([10.25+4,12.5,1+3.25+0.7]) cylinder(d=5.5,h=0.7,$fn=16);
     }
     color("orange") translate([1.75,8.625,1]) cube([8.5,7.75,1.5]);
     color("brown") translate([24-5.75,2.75,-2.75]) cube([4.5,19.5,2.75]);
     color("black") translate([22.75,2,-2.75]) cube([1.25,21,2.75]);
     color("grey") translate([24,4.25,-1]) cube([10,16.5,0.1]);
}
    
// header: 0 no, 1= up, -1, down
module zero( header= 1)
{
    
        
    hx=3.5-65/2+29-10*2.54;
    hy=30/2-3.5-2.54;
    hz=1.4;
    // Header
    if( header == 1)
        translate([hx,hy,hz])
	    header(20,2);
    if( header == -1)
        translate([hx,hy,hz])
	    mirror([0,0,1]) header(20,2);
    // Header
    if( header == 2)
        translate([hx,hy,hz])
	    stack(20,2);
    if( header == -2)
        translate([hx,hy,hz])
	    mirror([0,0,1]) stack(20,2);
      
    // PCB
    color("limegreen") difference()
    {
        hull()
        {
	    translate([-(65-6)/2,-(30-6)/2,0]) cylinder(r=3, h=1.4 );
	    translate([-(65-6)/2, (30-6)/2,0]) cylinder(r=3, h=1.4 );
	    translate([ (65-6)/2,-(30-6)/2,0]) cylinder(r=3, h=1.4 );
	    translate([ (65-6)/2, (30-6)/2,0]) cylinder(r=3, h=1.4 );
        }
        
        translate([-65/2+3.5,-23/2,-1]) cylinder(d=2.75, h=3);
        translate([-65/2+3.5, 23/2,-1]) cylinder(d=2.75, h=3);
        translate([65/2-3.5,-23/2,-1]) cylinder(d=2.75, h=3);
        translate([65/2-3.5, 23/2,-1]) cylinder(d=2.75, h=3);
    }
        
    translate([-65/2,-30/2,1.4])
    {
        // Micro SD Card
        color("silver") translate([1.5,16.9-5,0]) cube([12,10,1.4]);    
        color("darkgrey") translate([-2.5,16.9-5,0.25]) cube([4,10,1]);
        
        // micro USB
        color("silver") translate([41.4-8/2,-1.5,0]) cube([8,6,2.6]);
        color("silver") translate([54-8/2,-1.5,0]) cube([8,6,2.6]);
    
        // HDMI
        color("silver")  translate([12.4-11.4/2,-.5,0]) cube([11.3,7.5,3.1]);
        
        // Camera
        color("darkgrey") translate([65-3,(30-17)/2,0]) cube([4,17,1.3]);  
    }
}
    
    
module cubesatSpec(unit=2)
{
    un = 100;
    sizex = un;
    sizey = un;
    sizez = unit*un;
    
    railzp = 7;
    railzm = 6.5;
    railx = 10;
    raily = 10;
    rounding=1;
    
    translate([-sizex/2,-sizey/2,0])
	union()
    {
	for(xi=[0,sizex-railx])
	{
	    for(yi=[0,sizey-raily])
	    {
		//color("gray")
		translate([xi+rounding,yi+rounding,-railzm+rounding])
		    minkowski(){
		    cube([railx-2*rounding, raily-2*rounding, sizez+railzp+railzm-2*rounding]);
		    sphere(1);
		}
	    }
	}
    
    
    
	translate([railx-rounding,0,0])cube([sizex-2*railx+2*rounding, sizey, sizez]);
	translate([0,raily-rounding,0])cube([sizex, sizey-2*raily+2*rounding, sizez]);
    }
}


module cubesatPrint(unit=1)
{
    union()
    {
    cubesatSpec(unit=unit);
        
    un = 100;
    sizex = un;
    sizey = un;
    sizez = unit*un;
    
    railzp = 7;
    railzm = 6.5;
    railx = 10;
    raily = 10;
    rounding=1;
    
    angle=-45;
    
    translate([-sizex/2+railx-2*rounding,-sizey/2,0])
    for(xi=[0,sizex-railx-railx+2*rounding])
    {
        for(yi=[0,sizey-raily])
        {
            if(yi==0)
            {
                angi=0;
            }
            else
            {
                angi=180;
            }
        //color("gray")
        translate([xi+rounding,yi+rounding,-railzm+rounding])
	    rotate([0,angle,0])minkowski()
            {
                cube([railx-2*rounding, raily-2*rounding, railx-2*rounding]);
                sphere(1);
            }
        }
    }
    
    
    
    
    translate([-sizex/2+railx-2*rounding,-sizey/2,sizez])
    for(xi=[0,sizex-railx-railx+2*rounding-0.35])
    {
        for(yi=[0,sizey-raily])
        {
        //color("gray")
        translate([xi+rounding+0.2,yi+rounding,-railzm+rounding])
	    rotate([0,angle,0])minkowski()
            {
                cube([railx-2*rounding, raily-2*rounding, railx-2*rounding]);
                sphere(1);
            }
        }
    }
 
    }
}
    


uni=2;
fac=2.5;
cot=100;
ep=3;
piece = 1;
    


#cubesatSpec(unit=uni);
    
    if( piece==3 || piece==4)
translate([0,0,0])rotate([0,0,90])translate([0,10,40]){
    // Electronics stack
    translate([10,0,16])filterboard();
    translate([10,0,0])mopower();
    translate([0,13,-16])zero(header=2);
    translate([10,0,-34])solarpower();
    translate([43,-20,-22])rotate([90,0,0])rotate([90,0,90])rpi_camera();
    
 }
    
    
    
    if(piece==1 || piece==4)
    // Piece 1
difference()
{
    cubesatPrint(unit=uni);
    translate([-cot/2+ep,-cot/2+ep,ep])
	cube([cot,cot*uni,cot*uni-2*ep]);
    
    // Down plate holes
    translate([0,0,-0.1])cylinder(d=cot-45,h=100);
        
    *translate([15,37,-0.1])cylinder(d=15,h=100);
    *translate([15,-37,-0.1])cylinder(d=15,h=100);
    translate([0,39,-0.1])cylinder(d=12,h=100);
    translate([0,-39,-0.1])cylinder(d=12,h=100);
        
        
    *translate([37,15,-0.1])cylinder(d=15,h=100);
    *translate([-37,15,-0.1])cylinder(d=15,h=100);
    translate([39,0,-0.1])cylinder(d=12,h=100);
    translate([-39,0,-0.1])cylinder(d=12,h=100);
        
    translate([-10,0,0])rotate([0,0,90])translate([10,0,0])fix_holes();
    translate([10,0,0])rotate([0,0,90])translate([10,0,0])fix_holes();
    translate([10,-10,0])fix_holes();
    translate([10,10,0])fix_holes();
        
        
    translate([0,0,uni*100-1])cylinder(d=cot/fac,h=100,center=true);
        
    translate([-1,0,uni*100/4])rotate([0,90,0])cylinder(d=cot/fac,h=100,center=true);
    translate([-1,0,3*uni*100/4])rotate([0,90,0])cylinder(d=cot/fac,h=100,center=true);

    translate([0,-1,uni*100/4])rotate([90,0,0])cylinder(d=cot/fac,h=100,center=true);
    translate([0,-1,3*uni*100/4])rotate([90,0,0])cylinder(d=cot/fac,h=100,center=true);
        
    translate([cot/2-10,-cot/2,ep])
    rotate([0,0,45])
    translate([0,-cot/2,0])
           cube([cot,cot*uni,cot*uni-2*ep]);
        
    translate([cot/2-10,-cot/2,ep])
    rotate([0,0,45])
    translate([0,cot/2,0])
           cube([cot,cot*uni,cot*uni-2*ep]);
           
           
   translate([-cot/2-5+10,cot/2-5,uni*100/4])cylinder(d=3.3,h=500,center=true);
   translate([cot/2-5,-cot/2-5+10,uni*100/4])cylinder(d=3.3,h=500,center=true);
   translate([cot/2-5,cot/2-5,uni*100/4])cylinder(d=3.3,h=500,center=true);
   translate([-cot/2+5,-cot/2+5,uni*100/4])cylinder(d=3.3,h=500,center=true);
   
   translate([cot/2-5,-cot/2-5+10,uni*100+2])cylinder(d=8,h=10);
   translate([-cot/2-5+10,cot/2-5,uni*100+2])cylinder(d=8,h=10);
   translate([cot/2-5,cot/2-5,uni*100+2])cylinder(d=8,h=10);
   
   translate([cot/2-5,-cot/2-5+10,-10-7+5])cylinder(d=8,h=10);
   translate([-cot/2-5+10,cot/2-5,-10-7+5])cylinder(d=8,h=10);
   translate([cot/2-5,cot/2-5,-10-7+5])cylinder(d=8,h=10);
    
}


module bolt(d=10,hep=6)
{
    difference()
    {
hull()
{
cylinder(h=hep,d=d);
    translate([d/2-ep,-d/2,0])cube([ep,ep,hep]);
    translate([-d/2,d/2-ep,0])cube([ep,ep,hep]);
    translate([d/2-ep,d/2-ep,0])cylinder(d=ep,h=hep);
}
translate([0,0,-hep])cylinder(d=3.3, h=3*hep );
translate([0,0,hep-2.5])cylinder(d=6.2+0.5, h=3*hep,$fn=6 );
}
}

module trig(d=10,hep=100)
{
    difference()
    {
hull()
{
    translate([d/2-ep,-d/2,0])cube([ep,ep,hep]);
    translate([-d/2,d/2-ep,0])cube([ep,ep,hep]);
    translate([d/2-ep,d/2-ep,0])cylinder(d=ep,h=hep);
}
}
}


 clearance = 2.5-ep;



    if(piece==2 || piece==4)
// Piece 2
difference()
{
union()
{
    union()
{

difference()
{
    cubesatPrint(unit=uni);
    
   // Remove interior 
difference()
{
    translate([-cot/2-ep,-cot/2-ep,-1])
	cube([cot,cot,cot*uni+2]);
    
    translate([-cot/2,cot/2-10,ep])
	cube([ep,10,cot*uni-2*ep]);
    
    translate([cot/2-10,-cot/2,ep])
	cube([10,ep,cot*uni-2*ep]);
    
}


   // Remove top and bottom 
    translate([-cot/2-ep,-cot/2-ep,-cot+ep+clearance])
	cube([cot+2*ep,cot+2*ep,cot]);
    
    translate([-cot/2-ep,-cot/2-ep,cot*uni-ep-clearance])
	cube([cot+2*ep,cot+2*ep,cot]);

// Let the screw bolt in
translate([cot/2-diam/2,cot/2-diam/2,0])rotate([3,-3,0])cylinder(d=9,h=50);
translate([cot/2-diam/2,cot/2-diam/2,cot*uni-ep-clearance])rotate([180,0,90])rotate([3,-3,0])cylinder(d=9,h=50);


translate([cot/2-diam/2,-cot/2+diam/2,ep+clearance])rotate([0,0,-90])rotate([3,-3,0])cylinder(d=9,h=50);
translate([cot/2-diam/2,-cot/2+diam/2,cot*uni-ep-clearance])rotate([180,0,0])rotate([3,-3,0])cylinder(d=9,h=50);


translate([-cot/2+diam/2,cot/2-diam/2+1,ep+clearance])rotate([0,0,90])rotate([8,-15,0])cylinder(d=9,h=50);
translate([-cot/2+diam/2,cot/2-diam/2+1,cot*uni-ep-clearance])rotate([180,0,180])rotate([15,-8,0])cylinder(d=9,h=50);


// Holes in sides
    translate([10,0,uni*100/4])rotate([0,90,0])cylinder(d=18,h=100,center=true);
    translate([10,0,3*uni*100/4])rotate([0,90,0])cylinder(d=cot/fac,h=100,center=true);

    translate([0,10,uni*100/4])rotate([90,0,0])cylinder(d=18,h=100,center=true);
    translate([0,10,3*uni*100/4])rotate([90,0,0])cylinder(d=cot/fac,h=100,center=true);

// Camera hole
    translate([22,13,33])rotate([90,0,0])cylinder(d=23,h=100,center=true);
// Power plug hole
translate([22,13,13])rotate([90,0,0])cylinder(d=13,h=100,center=true);
// Jack hole
translate([-26,13,13])rotate([90,0,0])cylinder(d=13,h=100,center=true);

rotate([0,0,-90])
{
// Camera hole
    translate([22,13,33])rotate([90,0,0])cylinder(d=23,h=100,center=true);
// Power plug hole
translate([22,13,13])rotate([90,0,0])cylinder(d=13,h=100,center=true);
// Jack hole
translate([-26,13,13])rotate([90,0,0])cylinder(d=13,h=100,center=true);
}
}
}



diam=10;
epes=5;

// Bolting
translate([cot/2-diam/2,cot/2-diam/2,ep+clearance])bolt(d=diam,hep=epes);
translate([cot/2-diam/2,cot/2-diam/2,cot*uni-ep-clearance])rotate([180,0,90])bolt(d=diam,hep=epes);


translate([cot/2-diam/2,-cot/2+diam/2,ep+clearance])rotate([0,0,-90])bolt(d=diam,hep=epes);
translate([cot/2-diam/2,-cot/2+diam/2,cot*uni-ep-clearance])rotate([180,0,0])bolt(d=diam,hep=epes);


translate([-cot/2+diam/2,cot/2-diam/2,ep+clearance])rotate([0,0,90])bolt(d=diam,hep=epes);
translate([-cot/2+diam/2,cot/2-diam/2,cot*uni-ep-clearance])rotate([180,0,180])bolt(d=diam,hep=epes);

difference()
{
translate([-cot/2+diam/2,cot/2-diam/2,ep+epes+clearance])rotate([0,0,90])trig(hep=cot*uni-2*epes-2*ep-clearance);
    
*translate([-cot/2+ep+10,cot/2-10-ep,ep])rotate([0,0,0])cylinder(d=20,h=150);

// Arched support
    for(i=[2.5:20:cot*uni])
{
translate([-cot/2+ep+10,cot/2+30,ep+epes+i])rotate([90,0,0])cylinder(d=20,h=100);
}

// Let the screw bolt in
translate([-cot/2+diam/2,cot/2-diam/2+1,ep+clearance])rotate([0,0,90])rotate([8,-15,0])cylinder(d=9,h=50);
translate([-cot/2+diam/2,cot/2-diam/2+1,cot*uni-ep-clearance])rotate([180,0,180])rotate([15,-8,0])cylinder(d=9,h=50);
}



translate([-cot/2+diam/2+6,cot/2-diam/2+2,ep+clearance])rotate([0,0,90])trig(hep=epes,d=6);
translate([-cot/2+diam/2+6,cot/2-diam/2+2,cot*uni-ep-epes-clearance])rotate([0,0,90])trig(hep=epes,d=6);


*translate([cot/2-10/2,cot/2-10/2,cot-30])rotate([0,0,0])trig(hep=ep,d=10);

}




    translate([5,-14,-ep])rotate([0,0,-45+180])cube([100,100,200]);
    translate([70,-79,-ep])rotate([0,0,-45+180])cube([100,100,200]);
}


