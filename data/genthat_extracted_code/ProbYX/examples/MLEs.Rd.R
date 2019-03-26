library(ProbYX)


### Name: MLEs
### Title: Maximum likelihood estimates of the stress-strength model R =
###   P(Y<X).
### Aliases: MLEs
### Keywords: maximum likelihood estimate Stress-strength reliability
###   estimates

### ** Examples

	# data from the first population
	Y <- rnorm(15, mean=5, sd=1)        
	# data from the second population
    X <- rnorm(10, mean=7, sd=1.5)      
    # vector of MLEs for the nuisance parameters and the quantity R
    MLEs(Y, X, "norm_DV")  



