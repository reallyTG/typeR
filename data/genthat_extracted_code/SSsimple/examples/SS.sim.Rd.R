library(SSsimple)


### Name: SS.sim
### Title: Simulation
### Aliases: SS.sim
### Keywords: ~kwd1 ~kwd2

### ** Examples

tau <- 30	
	
x <- I( 0:10 / 10 )

H <- H.omega.sincos( x, c( 1*pi, 4*pi ) )

xs <- SS.sim( 0.99, H, 1, 2, tau, rep(0, ncol(H)) )

## Not run: 
##D for(i in 1:nrow(xs$Z)) {
##D 	plot(x, xs$Z[ i, ], ylim=range(xs$Z), main=i)
##D 	Sys.sleep(1/10)
##D }
## End(Not run)



