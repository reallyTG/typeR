library(bingat)


### Name: estLogLik
### Title: Estimate the Log Likelihood Value
### Aliases: estLogLik

### ** Examples

	data(braingraphs)
	
	braingstar <- estGStar(braingraphs) 
	braintau <- estTau(braingraphs, "adjMatrix", braingstar)
	brainll <- estLogLik(braingraphs, "adjMatrix", braingstar, braintau)
	brainll



