library(raster)


### Name: merge
### Title: Merge Raster* objects
### Aliases: merge merge,Raster,Raster-method
###   merge,RasterStackBrick,missing-method merge,Extent,ANY-method
### Keywords: methods spatial

### ** Examples

r1 <- raster(xmx=-150, ymn=60, ncols=30, nrows=30)
r1[] <- 1:ncell(r1)
r2 <- raster(xmn=-100, xmx=-50, ymx=50, ymn=30)
res(r2) <- c(xres(r1), yres(r1))
r2[] <- 1:ncell(r2)
rm <- merge(r1, r2)

# if you have many RasterLayer objects in a list
# you can use do.call:
x <- list(r1, r2)
# add arguments such as filename
# x$filename <- 'test.tif'
m <- do.call(merge, x)



