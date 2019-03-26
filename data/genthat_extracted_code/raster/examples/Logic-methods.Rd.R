library(raster)


### Name: Logic-methods
### Title: Logical operators and functions
### Aliases: Logic-methods Logic,Raster,Raster-method is.na,Raster-method
###   is.nan,Raster-method is.finite,Raster-method
###   is.infinite,Raster-method !,Raster-method
### Keywords: methods math

### ** Examples

r <- raster(ncols=10, nrows=10)
r[] <- runif(ncell(r)) * 10
r1 <- r < 3 | r > 6
r2 <- !r1
r3 <- r >= 3 & r <= 6
r4 <- r2 == r3
r[r>3] <- NA
r5 <- is.na(r)
r[1:5]
r1[1:5]
r2[1:5]
r3[1:5]




