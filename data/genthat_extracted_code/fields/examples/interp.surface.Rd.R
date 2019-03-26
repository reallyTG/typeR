library(fields)


### Name: interp.surface
### Title: Fast bilinear interpolator from a grid.
### Aliases: interp.surface interp.surface.grid
### Keywords: spatial

### ** Examples

#
# evaluate an image at a finer grid
# 

data( lennon)
# create an example in the right list format like image or contour
obj<- list( x= 1:20, y=1:20, z= lennon[ 201:220, 201:220])

set.seed( 123)
# lots of random points
N<- 500
loc<- cbind( runif(N)*20, runif(N)*20)
z.new<- interp.surface( obj, loc)
# compare the image with bilinear interpolation at scattered points
set.panel(2,2)
image.plot( obj)
quilt.plot( loc, z.new) 


# sample at 100X100 equally spaced points on a grid

grid.list<- list( x= seq( 1,20,,100), y=  seq( 1,20,,100))

interp.surface.grid( obj, grid.list)-> look

# take a look
set.panel(2,2)
image.plot( obj)
image.plot( look)




