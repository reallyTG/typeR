library(ProbYX)


### Name: rp
### Title: Signed log-likelihood ratio statistic
### Aliases: rp
### Keywords: signed log-likelihood ratio stress-strength reliability

### ** Examples

	# data from the first population
	Y <- rnorm(15, mean=5, sd=1)        
	# data from the second population
	X <- rnorm(10, mean=7, sd=1.5)      
	# value of \eqn{r_p} for \code{psi=0.9}
	rp(Y, X, 0.9,"norm_DV")             



