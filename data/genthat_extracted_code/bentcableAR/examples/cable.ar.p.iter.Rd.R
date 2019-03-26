library(bentcableAR)


### Name: cable.ar.p.iter
### Title: Bent-Cable Regression for Independent or AR Data, With Exception
### Aliases: cable.ar.p.iter
### Keywords: ts models regression nonlinear

### ** Examples

data(stagnant)
data(sockeye)

# 'stagnant': independent data cable fit
fit0 <- cable.ar.p.iter( c(.6,-.4,-.7,0,.5),
	stagnant$loght, stagnant$logflow )    # 'nls' fit
	# compare to this:
	# bentcable.ar( stagnant$loght, t.vect=stagnant$logflow,
	#	init.cable=c(.6,-.4,-.7,0,.5) )

fit0$fit   # 'fit0' SSE=0.005


# 'sockeye': AR(2) cable fit
fit1 <- cable.ar.p.iter( c(13,.1,-.5,11,4,.5,-.5),
	sockeye$logReturns, tol=1e-4 )    # "css" successful
	# compare to this:
	# fit1 <- bentcable.ar( sockeye$logReturns, 
	#	init.cable=c(13,.1,-.5,11,4), p=2 )

fit1$ar.p.fit$value     # 'fit1' SSE=4.9


# 'sockeye': AR(2) cable fit
fit2 <- cable.ar.p.iter( c(10,0,0,5,.1,.5,-.5), sockeye$logReturns, 
	tol=1e-4 )    # "css" unsuccessful, switched to "yw"
	# compare to this:
	# fit2 <- bentcable.ar(sockeye$logReturns, 
	#	init.cable=c(10,0,0,5,.1), p=2 )

cable.ar.p.iter( fit2$est, sockeye$logReturns, 
	tol=1e-4 )   # 'fit2' SSE=13.8 (from first line of screen output)


# 'sockeye': AR(4) stick fit
cable.ar.p.iter( c(13,.1,-.5,11,.5,-.5,.5,-.5),
	sockeye$logReturns, tol=1e-4, stick=TRUE )
	# compare to this:
	# bentcable.ar( sockeye$logReturns,
	#	init.cable=c(13,.1,-.5,11), p=4, stick=TRUE )



