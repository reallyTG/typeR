library(raster)


### Name: Summary-methods
### Title: Summary methods
### Aliases: Summary-methods mean,Raster-method Summary,Raster-method
### Keywords: methods spatial

### ** Examples

r1 <- raster(nrow=10, ncol=10)
r1 <- setValues(r1, runif(ncell(r1)))
r2 <- setValues(r1, runif(ncell(r1)))
r3 <- setValues(r1, runif(ncell(r1)))
r <- max(r1, r2, r3)
r <- range(r1, r2, r3, 1.2)

s <- stack(r1, r2, r3)
r <- mean(s, 2)



