library(baseline)


### Name: baseline.rollingBall
### Title: Rolling ball
### Aliases: baseline.rollingBall
### Keywords: baseline spectra

### ** Examples

data(milk)
bc.rollingBall <- baseline(milk$spectra[1,, drop=FALSE], wm=200, ws=200,
	method='rollingBall')
## Not run: 
##D 	plot(bc.rollingBall)
## End(Not run)



