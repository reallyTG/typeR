library(ProbYX)


### Name: ROC.plot
### Title: Estimated ROC curves
### Aliases: ROC.plot
### Keywords: ROC curve area under the ROC curve

### ** Examples

	# data from the non-diseased population
	Y <- rnorm(15, mean=5, sd=1)       
	# data from the diseased population
	X <- rnorm(10, mean=7, sd=1.5)      
 	ROC.plot(Y, X, "norm_DV", method = "RP", mc = 2)



