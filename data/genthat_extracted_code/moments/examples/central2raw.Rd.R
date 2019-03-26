library(moments)


### Name: central2raw
### Title: Central to raw moments
### Aliases: central2raw
### Keywords: math univar

### ** Examples

set.seed(1234)
x <- rnorm(10000)
mu.raw.x <- all.moments( x, order.max=4 )
eta.x <- mu.raw.x[2]
mu.central.x <- all.moments( x, central=TRUE, order.max=4 )
central2raw( mu.central.x, eta.x )
mu.raw.x
M <- matrix( x, nrow=1000, ncol=10 )
mu.raw.M <- all.moments( M, order.max=4 )
eta.M <- mu.raw.M[2,]
mu.central.M <- all.moments( M, central=TRUE, order.max=4 )
central2raw( mu.central.M, eta.M )
mu.raw.M
D <- data.frame( M )
mu.raw.D <- all.moments( D, order.max=4 )
eta.D <- mu.raw.D[2,]
mu.central.D <- all.moments( D, central=TRUE, order.max=4 )
central2raw( mu.central.D, eta.D )
mu.raw.D



