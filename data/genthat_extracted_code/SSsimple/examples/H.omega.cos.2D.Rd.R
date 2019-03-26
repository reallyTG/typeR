library(SSsimple)


### Name: H.omega.cos.2D
### Title: Bases Transformation
### Aliases: H.omega.cos.2D
### Keywords: ~kwd1 ~kwd2

### ** Examples

x <- rep( I(0:10) / 10,   11 )
y <- rep( I(0:10) / 10,   each=11 )
u.x <- I(1:2) * pi
u.y <- I(1:2) * pi
H <- H.omega.cos.2D(x, y, u.x, u.y, c(0,0), c(0,0))

b <- rep(1, ncol(H))

z <- H %*% b

plot(x, y, cex=z-min(z))




