library(landscapeR)


### Name: rmSingle
### Title: Remove single tones from patches
### Aliases: rmSingle

### ** Examples

library(raster)
m = matrix(0, 33, 33)
r = raster(m, xmn=0, xmx=10, ymn=0, ymx=10)
patchSize = 500

## Make a patch and introduce a single tone cell
r = makePatch(r, patchSize, spt=578, rast=TRUE)
r[578] = 0
plot(r)

## Now remove it
plot( rmSingle(r) )

## Single tones can be identified but not removed:
rmSingle(r, rm = FALSE)



