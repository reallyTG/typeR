library(fabMix)


### Name: complete.log.likelihood_q0_sameSigma
### Title: Complete log-likelihood function for xCx models and q=0
### Aliases: complete.log.likelihood_q0_sameSigma

### ** Examples

	library('fabMix')
	data(waveDataset1500)
	x_data <- scale(waveDataset1500[ 1:20, -1]) # data
	z <-  waveDataset1500[ 1:20, 1]	# class
	p <- dim(x_data)[2]
	q <- 2
	K <- length(table(z))		# 3 classes
	# give some arbitrary values to the parameters:
	set.seed(1)
	w <- rep(1/K, K)
	mu <- array( -0.1 + 0.2*runif(K * p), dim = c(K,p) )
	SigmaINV <- array( 1, dim = c(p,p))
	# compute the complete.log.likelihood ( -inf )
	complete.log.likelihood_q0_sameSigma(x_data = x_data, w = w, mu = mu, 
		SigmaINV = SigmaINV, z = z)



