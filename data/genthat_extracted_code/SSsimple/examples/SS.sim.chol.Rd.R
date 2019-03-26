library(SSsimple)


### Name: SS.sim.chol
### Title: Simulation
### Aliases: SS.sim.chol
### Keywords: ~kwd1 ~kwd2

### ** Examples

tau <- 30	
	
x <- I( 0:10 / 10 )

H <- H.omega.sincos( x, c( 1*pi, 4*pi ) )

R <- diag(7, length(x))
R.chol <- chol(R, pivot=TRUE)

xs <- SS.sim.chol( 0.99, H, 1, R.chol, tau, rep(0, ncol(H)) )

## Not run: 
##D for(i in 1:nrow(xs$Z)) {
##D 	plot(x, xs$Z[ i, ], ylim=range(xs$Z), main=i)
##D 	Sys.sleep(1/10)
##D }
## End(Not run)




