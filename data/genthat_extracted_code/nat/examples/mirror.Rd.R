library(nat)


### Name: mirror
### Title: Mirror 3D object about a given axis, optionally using a warping
###   registration
### Aliases: mirror mirror.character mirror.default mirror.neuronlist

### ** Examples

nopen3d()
x=Cell07PNs[[1]]
mx=mirror(x,168)
## No test: 
plot3d(x,col='red')
plot3d(mx,col='green')
## End(No test)

# also works with dotprops objects
clear3d()
y=kcs20[[1]]
my=mirror(y,mirrorAxisSize=564.2532,transform='flip')
## No test: 
plot3d(y, col='red')
plot3d(my, col='green')
## End(No test)

## Not run: 
##D ## Example with an image
##D # note that we must specify an output image (obviously) but that as a
##D # convenience mirror calculates the mirrorAxisSize for us
##D mirror('myimage.nrrd', output='myimage-mirrored.nrrd', 
##D   warpfile='myimage_mirror.list')
##D 
##D # Simple flip along a different axis
##D mirror('myimage.nrrd', output='myimage-flipped.nrrd', mirrorAxis="Y", 
##D   transform='flip')
## End(Not run)



