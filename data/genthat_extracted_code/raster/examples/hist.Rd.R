library(raster)


### Name: hist
### Title: Histogram
### Aliases: hist hist,Raster-method
### Keywords: methods spatial

### ** Examples
 
r1 <- raster(nrows=50, ncols=50)
r1 <- setValues(r1, runif(ncell(r1)))
r2 <- setValues(r1, runif(ncell(r1)))
rs <- r1 + r2
rp <- r1 * r2
par(mfrow=c(2,2))
plot(rs, main='sum')
plot(rp, main='product')
hist(rs)
a = hist(rp)
a



