library(MLDS)


### Name: simu.6pt
### Title: Perform Bootstrap Test on 6-point Likelihood for MLDS FIT
### Aliases: simu.6pt
### Keywords: datagen misc

### ** Examples

	data(kk1)
	x.mlds <- mlds(SwapOrder(kk1))
	#nsim should be near 10,000 for stability,
	# but this will take a little time
	simu.6pt(x.mlds, 100, nrep = 1)



