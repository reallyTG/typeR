library(dismo)


### Name: ssb
### Title: Spatial sorting bias
### Aliases: ssb
### Keywords: spatial

### ** Examples

ref <- matrix(c(-54.5,-38.5, 2.5, -9.5, -45.5, 1.5, 9.5, 4.5, -10.5, -10.5), ncol=2)
p <- matrix(c(-56.5, -30.5, -6.5, 14.5, -25.5, -48.5, 14.5, -2.5, 14.5, 
        -11.5, -17.5, -11.5), ncol=2)
r <- raster()
extent(r) <- c(-110, 110, -45, 45)
r[] <- 1
set.seed(0)
a <- randomPoints(r, n=50)
b <- ssb(p, a, ref)

# distances in km
b / 1000

# an index of spatial sorting bias (1 is no bias, near 0 is extreme bias)
b[1] / b[2]



