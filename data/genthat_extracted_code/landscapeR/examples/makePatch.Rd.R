library(landscapeR)


### Name: makePatch
### Title: Create a single patch
### Aliases: makePatch

### ** Examples

library(raster)
mtx = matrix(0, 33, 33)
r = raster(mtx, xmn=0, xmx=10, ymn=0, ymx=10)
patchSize = 500
rr = makePatch(r, patchSize, rast=TRUE)
plot(rr)

## Create a patch with value 3, starting from the centre cell
mtx = matrix(0, 33, 33)
r = raster(mtx, xmn=0, xmx=10, ymn=0, ymx=10)
newVal = 3
centre = 545
cells = makePatch(r, patchSize, centre)
r[cells] = newVal
plot(r)

## Now create a new patch with value 10 and size 100 inside the existing patch
rr = makePatch(r, 100, bgr=newVal, rast=TRUE, val=10)
plot(rr)



