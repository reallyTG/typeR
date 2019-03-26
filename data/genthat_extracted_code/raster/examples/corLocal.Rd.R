library(raster)


### Name: corLocal
### Title: Local correlation coefficient
### Aliases: corLocal corLocal,RasterLayer,RasterLayer-method
###   corLocal,RasterStackBrick,RasterStackBrick-method
### Keywords: methods spatial

### ** Examples

b <- stack(system.file("external/rlogo.grd", package="raster"))
b <- aggregate(b, 2, mean)

set.seed(0)
b[[2]] <- flip(b[[2]], 'y') + runif(ncell(b))
b[[1]] <- b[[1]] + runif(ncell(b))

x <- corLocal(b[[1]], b[[2]], test=TRUE )
# plot(x)

# only cells where the p-value < 0.1
xm <- mask(x[[1]], x[[2]] < 0.1, maskvalue=FALSE)
plot(xm)


# for global correlation, use the cor function
x <- as.matrix(b)
cor(x, method="spearman")
 
# use sampleRegular for large datasets
x <- sampleRegular(b, 1000)
cor.test(x[,1], x[,2])

# RasterStack or Brick objects
y <- corLocal(b, flip(b, 'y'))



