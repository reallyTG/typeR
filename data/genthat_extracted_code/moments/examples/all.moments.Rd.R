library(moments)


### Name: all.moments
### Title: Statistical Moments
### Aliases: all.moments
### Keywords: math univar

### ** Examples

set.seed(1234)
x <- rnorm(10000)
all.moments( x, order.max=4 )
all.moments( x, central=TRUE, order.max=4 )
all.moments( x, absolute=TRUE, order.max=4 )
all.moments( x, central=TRUE, absolute=TRUE, order.max=4 )
M <- matrix( x, nrow=1000, ncol=10 )
all.moments( M, order.max=4 )
all.moments( M, central=TRUE, order.max=4 )
all.moments( M, absolute=TRUE, order.max=4 )
all.moments( M, central=TRUE, absolute=TRUE, order.max=4 )
D <- data.frame( M )
all.moments( D, order.max=4 )
all.moments( D, central=TRUE, order.max=4 )
all.moments( D, absolute=TRUE, order.max=4 )
all.moments( D, central=TRUE, absolute=TRUE, order.max=4 )



