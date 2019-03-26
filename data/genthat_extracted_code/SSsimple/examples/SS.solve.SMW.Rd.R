library(SSsimple)


### Name: SS.solve.SMW
### Title: Optimal Estimation
### Aliases: SS.solve.SMW
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(999)
H <- matrix(1)
R <- 7
inv.R <- 1 / R
x <- SS.sim( 1, H, 1, R, 100, 0 )
y <- SS.solve.SMW( x$Z, 1, H, 1, inv.R, 100, 10^5, 0 )

z.hat <- t( H %*% t( y$B.apri ) )

plot( x$Z, type="l", col="blue" )
points( z.hat[ ,1], type="l", col="red" )



