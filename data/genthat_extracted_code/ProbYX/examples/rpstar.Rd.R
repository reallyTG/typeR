library(ProbYX)


### Name: rpstar
### Title: Modified signed log-likelihood ratio statistic
### Aliases: rpstar
### Keywords: modified signed log-likelihood ratio stress-strength
###   reliability likelihood asymptotics

### ** Examples

	# data from the first population
	Y <- rnorm(15, mean=5, sd=1)      
	# data from the second population  
	X <- rnorm(10, mean=7, sd=1.5) 
	# value of \eqn{r_p^*} for \code{psi=0.9}     
	rpstar(Y, X, 0.9,"norm_DV")        
	# method has be set equal to "RPstar".



