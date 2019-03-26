library(fabMix)


### Name: complete.log.likelihood
### Title: Complete log-likelihood function for xCx models.
### Aliases: complete.log.likelihood

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
	SigmaINV <- array(1, dim = c(p,p))
	# compute the complete.log.likelihood
	complete.log.likelihood(x_data = x_data, w = w, mu = mu, 
		Lambda = Lambda, SigmaINV = SigmaINV, z = z)



