library(bingat)


### Name: rGibbs
### Title: Generate Random Data
### Aliases: rGibbs

### ** Examples

	data(braingraphs)
	
	braingstar <- estGStar(braingraphs)
	braintau <- estTau(braingraphs, "adjMatrix", braingstar)
	randombraingraphs <- rGibbs(braingstar, braintau, "adjMatrix", 3) 
	randombraingraphs[1:5,]



