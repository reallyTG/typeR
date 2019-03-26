library(orthopolynom)


### Name: scaleX
### Title: Scale values from [a,b] to [u.v]
### Aliases: scaleX
### Keywords: math

### ** Examples

x <- rnorm( 1000, 0, 10 )
y0 <- scaleX( x, u=0 , v=1 )
y1 <- scaleX( x, u=-1, v=1 )
y2 <- scaleX( x, u=-Inf, v=0 )
y3 <- scaleX( x, u=0, v=Inf )
y4 <- scaleX( x, u=-Inf, v=Inf )



