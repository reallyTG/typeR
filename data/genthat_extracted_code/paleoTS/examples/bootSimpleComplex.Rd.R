library(paleoTS)


### Name: bootSimpleComplex
### Title: Use parametric bootstrapping to test the fit of a complex model
###   relative to a simpler one
### Aliases: bootSimpleComplex
### Keywords: models ts

### ** Examples

	x<- sim.GRW(ns=40)
	mS<- fitSimple(x, model="URW", method="Joint")
	mC<- fitModeShift(x, order="Stasis-RW", rw.model="URW", method="Joint")
	compareModels(mS, mC)  ## AICc comparisons
	
	## No test: 
	boot<- bootSimpleComplex(x, mS, mC, nboot=20)
	cat("Bootstrap p-value: ", boot$p.value, "\n")
	
## End(No test)



