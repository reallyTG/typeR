library(bentcableAR)


### Name: cable.fit.known.change
### Title: Grid-based Bent-Cable Regression for Independent or AR Data
### Aliases: cable.fit.known.change cable.dev cable.ar.0.fit
### Keywords: dplot ts models regression nonlinear

### ** Examples

data(stagnant)
data(sockeye)

# non-time-series data: compute grid-based profile deviance
cable.dev( seq(-.04,.16,length=10), seq(.2,.65,length=10), 
	stagnant$loght, stagnant$logflow )
	# compare to this:
	# bentcable.dev.plot( seq(-.04,.16,length=10), 
	#	seq(.2,.65,length=10), stagnant$loght, stagnant$logflow )$dev

# AR(2) bent cable, start time at 0: find best grid-based fit
dev <- cable.dev( seq(6,18,length=15), seq(.01,12,length=15),
		sockeye$logReturns, p=2 )
contour( seq(6,18,length=15), seq(.01,12,length=15), dev )
cable.fit.known.change( sockeye$logReturns, tau.v=seq(6,18,length=15), 
	gamma.v=seq(.01,12,length=15), dev.mat=dev, p=2 )

# AR(0) broken stick, start time at 80: find best overall fit
dev <- cable.dev ( seq(85,97,length=15), 0, sockeye$logReturns, 
	sockeye$year)
plot( seq(85,97,length=15), dev, type="l" )
cable.ar.0.fit( sockeye$logReturns, sockeye$year,
	tau.v=seq(85,97,length=15), gamma.v=0, dev.mat=dev, 
	stick=TRUE )
	# compare to this:
	# bentcable.ar( sockeye$logReturns, bentcable.dev.plot(
	#	seq(85,97,length=15), 0, sockeye$logReturns, sockeye$year, TRUE
	#	), stick=TRUE, t.vect=sockeye$year )



