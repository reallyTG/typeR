library(move)


### Name: raster2contour
### Title: Convert raster to contour lines
### Aliases: raster2contour raster2contour,.UD-method
###   raster2contour,.UDStack-method

### ** Examples

data(leroydbbmm)
data(leroydbgb)
data(dbbmmstack)

## from a DBBMM object
(cont1 <- raster2contour(leroydbbmm))
plot(cont1)

## from a dynBGB object
(cont2 <- raster2contour(leroydbgb, level=.95))
plot(cont2)

## from a DBBMMStack object
(cont3 <- raster2contour(dbbmmstack))
plot(cont3)
(cont4 <- raster2contour(dbbmmstack, level=c(.5,.95)))
plot(cont4)




