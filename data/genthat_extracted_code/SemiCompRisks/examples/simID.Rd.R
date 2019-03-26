library(SemiCompRisks)


### Name: simID
### Title: The function that simulates independent/cluster-correlated
###   semi-competing risks data under semi-Markov Weibull/Weibull-MVN
###   models.
### Aliases: simID
### Keywords: semi-competing risks analysis

### ** Examples

	library(MASS)
	set.seed(123456)
	
	J = 110
	nj = 50
	n = J * nj

	id <- rep(1:J, each = nj)

	kappa1.true <- 0.05
	kappa2.true <- 0.01
	kappa3.true <- 0.01
	alpha1.true <- 0.8
	alpha2.true <- 1.1
	alpha3.true <- 0.9
	beta1.true <- c(0.5, 0.8, -0.5)
	beta2.true <- c(0.5, 0.8, -0.5)
	beta3.true <- c(1, 1, -1)
	SigmaV.true <- matrix(0.25,3,3)
	theta.true <- 0.5
	cens <- c(90, 90)

	cov1 <- matrix(rnorm((length(beta1.true)-1)*n, 0, 1), n, length(beta1.true)-1)
	cov2 <- sample(c(0, 1), n, replace = TRUE)
	x1 <- as.data.frame(cbind(cov1, cov2))
	x2 <- as.data.frame(cbind(cov1, cov2))
	x3 <- as.data.frame(cbind(cov1, cov2))
	
	simData <- simID(id, x1, x2, x3, beta1.true, beta2.true, beta3.true, 
				alpha1.true, alpha2.true, alpha3.true, 
				kappa1.true, kappa2.true, kappa3.true, 
				theta.true, SigmaV.true, cens)	
   				    				



