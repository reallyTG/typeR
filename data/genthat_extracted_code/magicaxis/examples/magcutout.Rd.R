library(magicaxis)


### Name: magcutout
### Title: Image Cutout Utilities
### Aliases: magcutout magcutoutWCS magWCSradec2xy magWCSxy2radec
### Keywords: cutout WCS

### ** Examples

## Not run: 
##D temp=matrix(1:121,11)
##D 
##D #The central value is at:
##D 
##D temp[6,6]
##D 
##D print(magcutout(temp, dim(temp)/2, box=c(3,3))$image)
##D 
##D #Given we cutout around the centre of the central pixel [5.5,5.5], the new centre
##D #relative to the cutout image output should be at [1.5,1.5]:
##D 
##D print(magcutout(temp, dim(temp)/2, box=c(3,3))$loc.orig)
##D print(magcutout(temp, dim(temp)/2, box=c(3,3))$loc)
##D 
##D # A simple WCS cutout example:
##D 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFit"))
##D 
##D par(mar=c(3.1,3.1,1.1,1.1))
##D magcutout(image$imDat, loc=c(50.5,50.5), plot=TRUE)
##D magcutoutWCS(image, loc=c(50.5,50.5), loc.type = 'image', plot=TRUE)
##D 
##D #We can cut out using the coordinates instead:
##D print({tempcoord=magWCSxy2radec(50.5,50.5,header=image$hdr)})
##D magcutoutWCS(image, loc=tempcoord, plot=TRUE)
##D 
##D #You can select coordinates too:
##D 
##D magcutoutWCS(image, loc=c(352.29167, -31.827777), box=c(30,30), plot=TRUE)$loc.WCS
##D magcutoutWCS(image, loc=c("23:29:10", "-31:49:40"), box=c(30,30) , coord.type = 'sex',
##D plot=TRUE)$loc.WCS
##D 
##D #We can add RA Dec specific decorations easily:
##D 
##D cutim=magcutoutWCS(image, loc=c(352.2918, -31.82652), box=c(30,30), plot=TRUE)
##D 
##D #Approx overlays:
##D 
##D points(cutim$approx.map(c(352.2918, 352.2897), c(-31.82652, -31.8252)), pch=3, col='blue')
##D 
##D #Exact overlays:
##D 
##D points(magWCSradec2xy(c(352.2918, 352.2897), c(-31.82652, -31.8252), header=cutim$header),
##D col='red')
##D 
##D #Given we correctly modify the header, we can actually use the cut down image directly:
##D 
##D magimageWCS(cutim)
##D 
##D # Now test the various cutout size options by asking for a large cutout near the image boundary
##D 
##D loc = c(300,340)
##D box = c(200,200)
##D loc.type = c("image","image")
##D 
##D # By default, the cutout is exactly the request size, but the centre is shifted:
##D 
##D cutim=magcutoutWCS(image, loc=loc, box=box, coord.type="image", loc.type=loc.type,
##D 	plot=TRUE, shiftloc=TRUE, paddim=TRUE)
##D 
##D # Setting shiftloc=FALSE pads the image with NAs instead, preserving the size:
##D 
##D cutim=magcutoutWCS(image, loc=loc, box=box, coord.type="image", loc.type=loc.type,
##D 	plot=TRUE, shiftloc=FALSE, paddim=TRUE)
##D 
##D # Setting paddim=FALSE returns the largest possible cutout within the image bounds,
##D # without shifting the centre:
##D 
##D cutim=magcutoutWCS(image, loc=loc, box=box, coord.type="image", loc.type=loc.type, plot=TRUE,
##D 	shiftloc=FALSE, paddim=FALSE)
##D 
##D # Setting paddim=FALSE and shiftloc=TRUE returns a larger cutout, but with at most
##D # box/2 padding on either side:
##D 
##D cutim=magcutoutWCS(image, loc=loc, box=box, coord.type="image", loc.type=loc.type, plot=TRUE,
##D 	shiftloc=TRUE, paddim=FALSE)
##D 
##D # Setting shiftloc=FALSE and requesting a box size larger than the image returns a cutout with the
##D # requested box size:
##D 
##D box = c(400,400)
##D cutim=magcutoutWCS(image, loc=loc, box=box, coord.type="image", loc.type=loc.type, plot=TRUE,
##D 	shiftloc=FALSE, paddim=TRUE)
##D 
## End(Not run)



