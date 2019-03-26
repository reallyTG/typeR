library(raster)


### Name: which
### Title: Which cells are TRUE?
### Aliases: Which Which,RasterLayer-method
### Keywords: spatial

### ** Examples

r <- raster(ncol=10, nrow=10)
set.seed(0)
r[] <- runif(ncell(r))
r[r < 0.2 ] <- 0
r[r > 0.8] <- 1
r[r > 0 & r < 1 ] <- 0.5

Which(r, cells=TRUE)
Which(r > 0.5, cells=TRUE)

s1 <- r > 0.5
s2 <- Which(r > 0.5)
s1[1:15]
s2[1:15]

# this expression
x1 <- Which(r, na.rm=FALSE)
# is the inverse of
x2 <- r==0



