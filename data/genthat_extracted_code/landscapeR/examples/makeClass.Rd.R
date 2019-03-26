library(landscapeR)


### Name: makeClass
### Title: Create a class of patches.
### Aliases: makeClass

### ** Examples

library(raster)

m = matrix(0, 33, 33)
r = raster(m, xmn=0, xmx=10, ymn=0, ymx=10)
num = 5
size = 15
rr = makeClass(r, num, size)
plot(rr)

## Create a class of three patches of given size at three corners of the spatial context
size = c(10, 50, 200)
pts = c(1, 33, 1089)
rr = makeClass(r, 3, size, pts)
plot(rr)



