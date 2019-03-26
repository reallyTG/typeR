library(rsdepth)


### Name: inflate
### Title: inflates a convex polygon
### Aliases: inflate inflate.default
### Keywords: bivariateConvexhull

### ** Examples
## calculation of centroid of a random pointset
z = matrix(rnorm(24),nc=2)
x = convexhull(z)
y= inflate(x)



