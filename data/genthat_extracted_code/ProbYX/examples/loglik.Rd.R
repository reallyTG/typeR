library(ProbYX)


### Name: loglik
### Title: Log-likelihood of the bivariate distribution of (Y,X)
### Aliases: loglik
### Keywords: log-likelihood MLE

### ** Examples

	# data from the first population
	Y <- rnorm(15, mean=5, sd=1)                  
    # data from the second population      
	X <- rnorm(10, mean=7, sd=1)                        
    mu1 <- 5                                           
    mu2 <- 7
    sigma <- 1
    # parameter of interest, the R probability
    interest <- pnorm((mu2-mu1)/(sigma*sqrt(2)))         
    # nuisance parameters
    nuisance <- c(mu1/(sigma*sqrt(2)), sigma*sqrt(2))    
    # log-likelihood value 
    loglik(Y, X, nuisance, interest, "norm_EV")        



