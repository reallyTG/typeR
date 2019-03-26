library(moments)


### Name: raw2central
### Title: Raw to central moments
### Aliases: raw2central
### Keywords: math univar

### ** Examples

set.seed(1234)
x <- rnorm(10000)
mu.raw.x <- all.moments( x, order.max=4 )
mu.central.x <- all.moments( x, central=TRUE, order.max=4 )
raw2central( mu.raw.x )
mu.central.x
M <- matrix( x, nrow=1000, ncol=10 )
mu.raw.M <- all.moments( M, order.max=4 )
mu.central.M <- all.moments( M, central=TRUE, order.max=4 )
raw2central( mu.raw.M )
mu.central.M
D <- data.frame( M )
mu.raw.D <- all.moments( D, order.max=4 )
mu.central.D <- all.moments( D, central=TRUE, order.max=4 )
raw2central( mu.raw.D )
mu.central.D



