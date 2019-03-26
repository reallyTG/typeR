library(dismo)


### Name: gridSample
### Title: Stratified regular sample on a grid
### Aliases: gridSample
### Keywords: spatial

### ** Examples

x <- rnorm(1000, 10, 5)
y <- rnorm(1000, 50, 5)
xy <- cbind(x,y)
res <- 5
r <- raster(extent(range(xy[,1]), range(xy[,2])) + res)
res(r) <- res

samp <- gridSample(xy, r, n=1)
plot(xy, cex=0.1)
points(samp, pch='x', col='red')



