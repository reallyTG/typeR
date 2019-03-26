library(bentcableAR)


### Name: cable.ar.p.diag
### Title: Bent-Cable AR(p>0) Diagnostics
### Aliases: cable.ar.p.diag
### Keywords: dplot ts models regression nonlinear

### ** Examples

data(sockeye)

# AR(2) cable fit
fit.ar2 <- cable.ar.p.iter( c(13,.1,-.5,11,4,.5,-.5),
	sockeye$logReturns, tol=1e-4 )
cable.ar.p.diag( fit.ar2, main="bent cable", main.all="Sockeye",
	ctp.ci=cable.change.conf( fit.ar2, .9 ) )
		# compare to this:
		# fit.ar2 <- bentcable.ar( sockeye$logReturns,
		#	init.cable=c(13,.1,-.5,11,4), p=2, main="Sockeye bent cable",
		#	ci.level=.9 )

# AR(4) stick fit
fit.ar4 <- cable.ar.p.iter( c(13,.1,-.5,11,.5,-.5,.5,-.5),
	sockeye$logReturns, tol=1e-4, stick=TRUE )
cable.ar.p.diag( fit.ar4, ctp.ci=cable.change.conf( fit.ar4, .95 ) )
		# compare to this:
		# fit.ar4 <- bentcable.ar( sockeye$logReturns,
		#	init.cable=c(13,.1,-.5,11), p=4, stick=TRUE )



