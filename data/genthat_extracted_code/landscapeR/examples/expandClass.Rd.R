library(landscapeR)


### Name: expandClass
### Title: Expand an existing class of patches.
### Aliases: expandClass

### ** Examples

library(raster)

m = matrix(0, 33, 33)
r = raster(m, xmn=0, xmx=10, ymn=0, ymx=10)
r = makeClass(r, 5, 10)
plot(r)

rr = expandClass(r, 1, 100)
plot(rr)

## This function can be used to mimic shapes, by providing a skeleton:
m[,17] = 1
r = raster(m, xmn=0, xmx=10, ymn=0, ymx=10)
plot(r)

rr = expandClass(r, 1, 100)
plot(rr)



