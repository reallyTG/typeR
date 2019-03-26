library(raster)


### Name: crosstab
### Title: Cross-tabulate
### Aliases: crosstab crosstab,Raster,Raster-method
###   crosstab,RasterStackBrick,missing-method
### Keywords: methods spatial

### ** Examples

r <- raster(nc=5, nr=5)
r[] <- runif(ncell(r)) * 2
s <- setValues(r, runif(ncell(r)) * 3)
crosstab(r,s)

rs <- r/s
r[1:5] <- NA
s[20:25] <- NA
x <- stack(r, s, rs)
crosstab(x, useNA=TRUE, long=TRUE)



