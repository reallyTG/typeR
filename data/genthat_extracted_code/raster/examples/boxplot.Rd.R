library(raster)


### Name: boxplot
### Title: Box plot of Raster objects
### Aliases: boxplot boxplot,RasterLayer-method
###   boxplot,RasterStackBrick-method
### Keywords: spatial

### ** Examples

r1 <- r2 <- r3 <- raster(ncol=10, nrow=10)
r1[] <- rnorm(ncell(r1), 100, 40)
r2[] <- rnorm(ncell(r1), 80, 10)
r3[] <- rnorm(ncell(r1), 120, 30)
s <- stack(r1, r2, r3)
names(s) <- c('A', 'B', 'C')

boxplot(s, notch=TRUE, col=c('red', 'blue', 'orange'), main='Box plot', ylab='random' )



