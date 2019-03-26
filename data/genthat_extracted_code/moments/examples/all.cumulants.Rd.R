library(moments)


### Name: all.cumulants
### Title: Statistical Cumulants
### Aliases: all.cumulants
### Keywords: math univar

### ** Examples

set.seed(1234)
x <- rnorm(10000)
mu.raw.x <- all.moments( x, order.max=6 )
all.cumulants( mu.raw.x )
M <- matrix( x, nrow=1000, ncol=10 )
mu.raw.M <- all.moments( M, order.max=6 )
all.cumulants( mu.raw.M )
D <- data.frame( M )
mu.raw.D <- all.moments( D, order.max=6 )
all.cumulants( mu.raw.D )



