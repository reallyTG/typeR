library(bentcableAR)


### Name: cable.ar.p.plot
### Title: Plot Bent Cable AR(p) Fit Over Data
### Aliases: cable.ar.p.plot
### Keywords: dplot ts models regression nonlinear

### ** Examples

data(sockeye)

# AR(2) cable fit
fit.ar2 <- cable.ar.p.iter( c(13,.1,-.5,11,4,.5,-.5),
	sockeye$logReturns, tol=1e-4 )
cable.ar.p.plot( fit.ar2, ctp.ci=cable.change.conf( fit.ar2, .9 ) )

	# compare to this:
	# fit.ar2 <- bentcable.ar( sockeye$logReturns, 
	#	init.cable=c(13,.1,-.5,11,4), p=2, ci.level=.9 )
	# cable.ar.p.plot( fit.ar2$cable, ctp.ci=fit.ar2$ctp )

# AR(4) stick fit
fit.ar4 <- cable.ar.p.iter( c(13,.1,-.5,11,.5,-.5,.5,-.5),
	sockeye$logReturns, tol=1e-4, stick=TRUE )
cable.ar.p.plot( fit.ar4, ctp.ci=cable.change.conf( fit.ar4, .9 ) )

	# compare to this:
	# fit.ar4 <- bentcable.ar( sockeye$logReturns,
	#	init.cable=c(13,.1,-.5,11), p=4, stick=TRUE, ci.level=.9 )
	# cable.ar.p.plot( fit.ar4$cable, ctp.ci=fit.ar4$ctp )



