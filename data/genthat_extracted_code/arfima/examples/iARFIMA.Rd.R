library(arfima)


### Name: iARFIMA
### Title: The Fisher information matrix of an ARFIMA process
### Aliases: iARFIMA
### Keywords: ts

### ** Examples


## No test: 
tick <- proc.time()
exactI <- iARFIMA(phi = c(.4, -.2), theta = c(.7), phiseas = c(.8, -.4),
	d = TRUE, dfs = TRUE, period = 12)
proc.time() - tick
tick <- proc.time()
approxI <- iARFIMA(phi = c(.4, -.2), theta = c(.7), phiseas = c(.8, -.4), 
	d = TRUE, dfs = TRUE, period = 12, exact = FALSE)
proc.time() - tick
exactI
max(abs(exactI - approxI))
## End(No test)




