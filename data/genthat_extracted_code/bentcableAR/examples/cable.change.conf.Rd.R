library(bentcableAR)


### Name: cable.change.conf
### Title: Confidence Interval for CTP of AR(p) Bent Cable
### Aliases: cable.change.conf
### Keywords: ts models regression nonlinear

### ** Examples

data(sockeye)

# AR(2) cable fit
fit.ar2 <- cable.ar.p.iter( c(13,.1,-.5,11,4,.5,-.5),
	sockeye$logReturns, tol=1e-4 )
cable.change.conf( fit.ar2, .9 )

	# compare to this:
	# fit.ar2 <- bentcable.ar( sockeye$logReturns, 
	#	init.cable=c(13,.1,-.5,11,4), p=2, ci.level=.9 )
	# cable.change.conf( fit.ar2$cable, .9 )

# AR(2) stick fit
stick.ar2 <- cable.ar.p.iter( c(13,.1,-.5,11,.5,-.5),
	sockeye$logReturns, tol=1e-4, stick=TRUE)
cable.change.conf( stick.ar2, .9)
	# compare to this:
	# stick.ar2 <- bentcable.ar( sockeye$logReturns,
	#	init.cable=c(13,.1,-.5,11), p=2, stick=TRUE, ci.level=.9 )
	#	cable.change.conf( stick.ar2$cable, .9 )

# AR(4) stick fit
fit.ar4 <- cable.ar.p.iter( c(13,.1,-.5,11,.5,-.5,.5,-.5),
	sockeye$logReturns, tol=1e-4, stick=TRUE )
cable.change.conf( fit.ar4, .9 )

	# compare to this:
	# fit.ar4 <- bentcable.ar( sockeye$logReturns,
	#	init.cable=c(13,.1,-.5,11), p=4, stick=TRUE, ci.level=.9 )
	# cable.change.conf( fit.ar4$cable, .9 )



