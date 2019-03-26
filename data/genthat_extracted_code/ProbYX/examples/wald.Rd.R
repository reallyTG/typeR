library(ProbYX)


### Name: wald
### Title: Wald statistic
### Aliases: wald
### Keywords: Wald statistic stress-strength reliability

### ** Examples

	# data from the first population
	Y <- rnorm(15, mean=5, sd=1) 
	# data from the second population       
	X <- rnorm(10, mean=7, sd=1.5) 
	# value of Wald for \code{psi=0.9}     
	wald(Y, X, 0.9,"norm_DV")            



