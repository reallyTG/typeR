library(SpatialVx)


### Name: locperf
### Title: Localization Performance Measures
### Aliases: locperf distob distmapfun
### Keywords: math

### ** Examples

x <- y <- matrix( 0, 10, 12)
x[2,3] <- 1
y[4,7] <- 1
x <- im( x)
y <- im( y)
x <- solutionset( x > 0)
y <- solutionset( y > 0)
locperf( x, y)

# Note that ph is NA because there is only 1 event.
# need to have at least k events if k > 1.

par( mfrow=c(1,2))
image.plot( distmapfun(x))
image.plot( distmapfun(y))



