library(fabMix)


### Name: observed.log.likelihood0_Sj_q0
### Title: Log-likelihood of the mixture model for q=0
### Aliases: observed.log.likelihood0_Sj_q0

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
	Sigma <- matrix(1:K, nrow = K, ncol = p)
	# compute the complete.log.likelihood
	observed.log.likelihood0_Sj_q0(x_data = x_data, w = w, 
		mu = mu, Sigma = Sigma, z = z)



