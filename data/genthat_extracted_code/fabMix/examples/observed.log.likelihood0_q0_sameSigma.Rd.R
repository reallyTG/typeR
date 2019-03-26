library(fabMix)


### Name: observed.log.likelihood0_q0_sameSigma
### Title: Log-likelihood of the mixture model for q=0 and same variance of
###   errors
### Aliases: observed.log.likelihood0_q0_sameSigma

### ** Examples

	library('fabMix')
	data(waveDataset1500)
	x_data <- waveDataset1500[ 1:20, -1] # data
	z <-  waveDataset1500[ 1:20, 1]	# class
	p <- dim(x_data)[2]
	q <- 2
	K <- length(table(z))		# 3 classes
	# give some arbitrary values to the parameters:
	set.seed(1)
	w <- rep(1/K, K)
	mu <- array( runif(K * p), dim = c(K,p) )
	SigmaINV <- array(1, dim = c(p,p))
	Sigma <- 1/diag(SigmaINV)
	# compute the complete.log.likelihood
	observed.log.likelihood0_q0_sameSigma(x_data = x_data, w = w, 
		mu = mu,  Sigma = Sigma, z = z)



