library(lfstat)


### Name: as.xts.lfobj
### Title: Convert Object To Class xts
### Aliases: as.xts.lfobj
### Keywords: low-flow

### ** Examples

data(ray)
r <- as.xts(ray)

# attributes of the lfobject are retained
attr(ray, "lfobj")
xtsAttributes(r)



