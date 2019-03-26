library(SemiCompRisks)


### Name: simSurv
### Title: The function that simulates independent/cluster-correlated
###   right-censored survival data under Weibull/Weibull-Normal model.
### Aliases: simSurv
### Keywords: univariate analysis

### ** Examples

	set.seed(123456)
	
	J = 110
	nj = 50
	n = J * nj

	id <- rep(1:J, each = nj)

	x	= matrix(0, n, 2)	
	x[,1]	= rnorm(n, 0, 2)	
	x[,2]	= sample(c(0, 1), n, replace = TRUE)

	beta.true = c(0.5, 0.5)
	
	alpha.true = 1.5		
	kappa.true = 0.02
	sigmaV.true = 0.1

	cens <- c(30, 40)		

	simData <- simSurv(id, x, beta.true, alpha.true, kappa.true, 
				sigmaV.true, cens) 		 



