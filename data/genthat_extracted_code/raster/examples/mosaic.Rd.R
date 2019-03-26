library(raster)


### Name: mosaic
### Title: Merge Raster* objects using a function for overlapping areas
### Aliases: mosaic mosaic,Raster,Raster-method
### Keywords: methods spatial

### ** Examples

r <- raster(ncol=100, nrow=100)
r1 <- crop(r, extent(-10, 11, -10, 11))
r2 <- crop(r, extent(0, 20, 0, 20))
r3 <- crop(r, extent(9, 30, 9, 30))

r1[] <- 1:ncell(r1)
r2[] <- 1:ncell(r2)
r3[] <- 1:ncell(r3)

m1 <- mosaic(r1, r2, r3, fun=mean)

s1 <- stack(r1, r1*2)
s2 <- stack(r2, r2/2)
s3 <- stack(r3, r3*4)
m2 <- mosaic(s1, s2, s3, fun=min)

# if you have a list of Raster objects, you can use do.call
x <- list(r1, r2, r3)
names(x)[1:2] <- c('x', 'y')
x$fun <- mean
x$na.rm <- TRUE

y <- do.call(mosaic, x)




