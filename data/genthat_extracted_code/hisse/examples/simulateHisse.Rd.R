library(hisse)


### Name: SimulateHisse
### Title: Simulate under a HiSSE model
### Aliases: SimulateHisse
### Keywords: simulation

### ** Examples

## No test: 
simulated.result <- SimulateHisse(c(.3, .1), c(.1, 0), 
matrix(c(NA, 0.2, .3, NA), nrow=2), max.taxa=35, x0=1)	
par(mfcol=c(1,2))
plot(SimToPhylo(simulated.result$results, include.extinct=TRUE))
plot(SimToPhylo(simulated.result$results, include.extinct=FALSE))
## End(No test) 	



