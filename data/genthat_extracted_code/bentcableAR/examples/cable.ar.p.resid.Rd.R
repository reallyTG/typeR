library(bentcableAR)


### Name: cable.ar.p.resid
### Title: Fitted Residuals and Innovations for AR(p>0) Bent Cable
### Aliases: cable.ar.p.resid
### Keywords: ts models regression nonlinear

### ** Examples

data(sockeye)

fit.ar2 <- cable.ar.p.iter( c(13,.1,-.5,11,4,.5,-.5),
	sockeye$logReturns, tol=1e-4 )
cable.ar.p.resid( fit.ar2 )



