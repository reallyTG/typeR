library(SSsimple)


### Name: SS.solve
### Title: Optimal Estimation
### Aliases: SS.solve
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(999)
H <- matrix(1)
x <- SS.sim( 1, H, 1, 1, 100, 0 )
y <- SS.solve( x$Z, 1, H, 1, 1, 100, 10^5, 0 )

z.hat <- t( H %*% t( y$B.apri ) )

plot( x$Z, type="l", col="blue" )
points( z.hat[ ,1], type="l", col="red" )



