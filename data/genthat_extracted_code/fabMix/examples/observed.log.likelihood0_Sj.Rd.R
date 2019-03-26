library(fabMix)


### Name: observed.log.likelihood0_Sj
### Title: Log-likelihood of the mixture model
### Aliases: observed.log.likelihood0_Sj

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
	Lambda <- array( runif(K*p*q), dim = c(K,p,q) )
	Sigma <- matrix(1:K, nrow = K, ncol = p)
	# compute the complete.log.likelihood
	observed.log.likelihood0_Sj(x_data = x_data, w = w, 
		mu = mu, Lambda = Lambda, Sigma = Sigma, z = z)



