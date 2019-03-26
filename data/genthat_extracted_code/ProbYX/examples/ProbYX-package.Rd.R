library(ProbYX)


### Name: ProbYX-package
### Title: Inference on the stress-strength model R = P(Y<X)
### Aliases: ProbYX-package ProbYX
### Keywords: stress-strength model

### ** Examples

	 # data from the first population
	 Y <- rnorm(15, mean=5, sd=1)    
	 # data from the second population
	 X <- rnorm(10, mean=7, sd=1.5)      
     level <- 0.01        # \eqn{\alpha} level 
     # estimate and confidence interval under the assumption of two
     # normal variables with different variances.
	 Prob(Y, X, "norm_DV", "RPstar", level)   
	 # method has to be set equal to "RPstar".



