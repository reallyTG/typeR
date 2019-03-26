library(bentcableAR)


### Name: fullcable.t
### Title: Evaluate Bent Cable Function
### Aliases: fullcable.t
### Keywords: models regression nonlinear

### ** Examples

	# basic broken stick, kink at 0:
	plot( seq(-10,10), fullcable.t(seq(-10,10),0,0,1,0,0) )
	
	# full bent cable, bend centred at 0 with half-width 3:
	plot( seq(-10,10), fullcable.t(seq(-10,10),1,.1,-.5,0,3) )



