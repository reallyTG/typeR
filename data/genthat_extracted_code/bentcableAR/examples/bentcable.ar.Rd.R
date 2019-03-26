library(bentcableAR)


### Name: bentcable.ar
### Title: Bent-Cable Regression for Independent and Autoregressive Data
### Aliases: bentcable.ar bentcable.dev.plot
### Keywords: dplot ts models regression nonlinear

### ** Examples


## Not run: 
##D 
##D # Scenario (1)
##D ##############
##D 
##D # independent non-time-series cable:
##D 
##D data(stagnant)
##D 
##D bentcable.dev.plot( seq(-1,1,length=20),
##D 	seq(.1,1,length=20), stagnant$loght, stagnant$logflow )
##D 
##D 	# zoom in to global max
##D 	dev0 <- bentcable.dev.plot( seq(-.04,.16,length=20), 
##D 		seq(.2,.65,length=20), stagnant$loght, stagnant$logflow )
##D 			# locally smooth deviance surface
##D 
##D 	cable <- bentcable.ar( stagnant$loght, tgdev=dev0, t.vect=stagnant$logflow )
##D 		# ignore time-series diagnostics
##D 		# local regularity - expect to be true best fit
##D 		# SSE=0.005
##D 		# feed 'cable' in Scenario (3) to get fitted plot:
##D 		#	bentcable.ar( cable$y, init.cable=coef(cable$fit),
##D 		#		t.vect=cable$t )
##D 
##D 
##D # AR(0) stick, start time at 80:
##D dev0 <- bentcable.dev.plot( seq(85,97,length=15), 0,
##D 	sockeye$logReturns, sockeye$year, TRUE )  # obvious global max
##D stick0 <- bentcable.ar( sockeye$logReturns, tgdev=dev0, stick=TRUE,
##D 	t.vect=sockeye$year )
##D 		# local regularity - should be true best fit
##D 		# SSE=8.85
##D 		# diagnostics: take p=0 to 4 ??
##D 
##D # AR(0) cable, start at time 0:
##D bentcable.dev.plot( seq(1,20,length=25), 
##D 	seq(.1,15,length=25), sockeye$logReturns )
##D 
##D 	# zoom in to global max
##D 	dev0 <- bentcable.dev.plot( seq(10,15,length=25),
##D 		seq(2,10,length=20), sockeye$logReturns )
##D 			# surface has ridge - expect some trouble locating true peak
##D 
##D 	cable0 <- bentcable.ar( sockeye$logReturns, tgdev=dev0 )
##D 		# apparent best AR(0) fit: SSE=8.68
##D 		# diagnostics: take p=2 to 6
##D 
##D 		# compare to this:
##D 		# dev1 <- bentcable.dev.plot( seq(10,15,length=25),
##D 		#	seq(2,10,length=15), sockeye$logReturns )
##D 		# bentcable.ar( sockeye$logReturns, tgdev=dev1 ) # SSE=8.683
##D 		#	# not an obvious local max!
##D 
##D 		# feed 'cable0' in Scenario (3) to get fitted plot:
##D 		#	bentcable.ar( cable0$y, init.cable=coef(cable0$fit) )
##D 
## End(Not run)




# Scenario (2)
##############

data(sockeye)

# AR(2) cable, start time at 0:
bentcable.dev.plot( seq(6,18,length=15),
	seq(.01,12,length=15), sockeye$logReturns, p=2 )

	# zoom in to global max
	dev2 <- bentcable.dev.plot( seq(10,12,length=15),
		seq(1,5,length=15), sockeye$logReturns, p=2 )

	# best grid-based fit
	gr.cable2 <- bentcable.ar( sockeye$logReturns, tgdev=dev2, p=2 )
		# to be used in Scenario (4)
		# local regularity - expect little trouble

# AR(2) stick, start time at 80:
bentcable.dev.plot( seq(86,98,length=15), y.vect=sockeye$logReturns, 
	p=2, stick=TRUE, t.vect=sockeye$year )

	# zoom in to global max
	dev3 <- bentcable.dev.plot( seq(88.5,93,length=25),
		y.vect=sockeye$logReturns, 
		p=2, stick=TRUE, t.vect=sockeye$year )
			# camel hump - double peaks!

	# best grid-based fit
	gr.stick2 <- bentcable.ar( sockeye$logReturns, tgdev=dev3, p=2, stick=TRUE,
		t.vect=sockeye$year )
			# irregularity - expect some trouble if used in Scenario (4)



## Not run: 
##D 
##D # AR(4) cable, start time at 0:
##D bentcable.dev.plot( seq(6,18,length=15), seq(.01,12,length=15), 
##D 	sockeye$logReturns, p=4 )
##D 
##D 	# zoom in to global max
##D 	dev4 <- bentcable.dev.plot( seq(10,12,length=15),
##D 		seq(1,7,length=25), sockeye$logReturns, p=4 )
##D 			# slight ridge
##D 
##D 	# best grid-based fit
##D 	gr.cable4 <- bentcable.ar( sockeye$logReturns, tgdev=dev4, p=4 )
##D 		# to be used in Scenario (4)
##D 		# will ridge be problem???
##D 
##D 
##D 
##D 
##D # Scenario (3)
##D ##############
##D 
##D # independent non-time-series cable:
##D 
##D data(stagnant)
##D 
##D bentcable.ar( stagnant$loght, t.vect=stagnant$logflow,
##D 	init.cable=c(.6,-.4,-.7,0,.5) )   # SSE=0.005
##D 		# identical to 'cable' in Scenario (1)
##D 		# no irregularity, no ambiguity!
##D 
##D 
##D 
##D # AR(0) stick, start time at 80:
##D bentcable.ar( sockeye$logReturns, init.cable=c(10,.1,-.5,90),
##D 	stick=TRUE, t.vect=sockeye$year )
##D 		# identical to 'stick0' in Scenario (1)
##D 		# local regularity, no trouble
##D 
##D 
##D # AR(0) stick, start time at 0:
##D bentcable.ar( sockeye$logReturns, init.cable=coef(cable0$fit)[1:5],
##D 	stick=TRUE )
##D 		# identical to 'cable0' in Scenario (1)
##D 		# here you get plot of fit and CTP confidence interval
##D 
## End(Not run)




# Scenario (4)
##############

# AR(2) cable, start time at 0:
# use 'gr.cable2' from Scenario (2)
cable2 <- bentcable.ar( sockeye$logReturns,
	init.cable=gr.cable2$init[1:5], init.phi=gr.cable2$init[-c(1:5)] )
		# "css" successful
		# best AR(2) fit, SSE=4.868
	
	# compare to this:
	# bentcable.ar( sockeye$logReturns,
	#	init.cable=c(13,.1,-.5,11,4), p=2 )
			# "css" successful, same SSE, virtually same fit
			# recall local regularity from 'dev2'

# AR(2) stick, start time at 80:
# use 'gr.stick2' from Scenario (2)
stick2 <- bentcable.ar( sockeye$logReturns, init.cable=gr.stick2$init[1:4],
		init.phi=gr.stick2$init[-c(1:4)], stick=TRUE, t.vect=sockeye$year )
			# "css" successful, best AR(2) fit, SSE=5.0

			# compare this to the other peak shown in 'dev3'
			#	bentcable.ar( sockeye$logReturns,
			#	init.cable=c(10,0,-.5,91.5), p=2, stick=TRUE,
			#		t.vect=sockeye$year )
						# "css" successful, SSE=5.1, not best fit!


## Not run: 
##D 
##D # AR(4) cable, start time at 0:
##D cable4 <- bentcable.ar( sockeye$logReturns,
##D 	init.cable=gr.cable4$init[1:5], init.phi=gr.cable4$init[-c(1:5)] )
##D 		# "css" unsuccessful, switched to "yw"
##D 		# feed 'cable4' in Scenario (4) to get SSE from screen output:
##D 
##D 		bentcable.ar( cable4$cable$y, init.cable=cable4$cable$est[1:5],
##D 			init.phi=cable4$cable$est[-c(1:5)] )
##D 				# SSE=2.47 from screen output
## End(Not run)



