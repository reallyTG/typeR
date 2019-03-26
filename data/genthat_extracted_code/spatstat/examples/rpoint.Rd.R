library(spatstat)


### Name: rpoint
### Title: Generate N Random Points
### Aliases: rpoint
### Keywords: spatial datagen

### ** Examples

 # 100 uniform random points in the unit square
 X <- rpoint(100)

 # 100 random points with probability density proportional to x^2 + y^2
 X <- rpoint(100, function(x,y) { x^2 + y^2}, 1)

 # `fmax' may be omitted
 X <- rpoint(100, function(x,y) { x^2 + y^2})

 # irregular window
 data(letterR)
 X <- rpoint(100, function(x,y) { x^2 + y^2}, win=letterR)

 # make a pixel image 
 Z <- setcov(letterR)
 # 100 points with density proportional to pixel values
 X <- rpoint(100, Z)



