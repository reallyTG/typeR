library(fabMix)


### Name: compute_A_B_G_D_and_simulate_mu_Lambda
### Title: Computation and simulations
### Aliases: compute_A_B_G_D_and_simulate_mu_Lambda

### ** Examples

	library('fabMix')
	data(waveDataset1500)
	x_data <- scale(as.matrix(waveDataset1500[ 1:20, -1])) # data
	z <-  waveDataset1500[ 1:20, 1] # class
	p <- dim(x_data)[2]
	n <- dim(x_data)[1]
	q <- 2
	K <- length(table(z))           # 3 classes

	T_INV <- array(data = 0, dim = c(p,p))
	diag(T_INV) <- diag(var(x_data))
	diag(T_INV) <- 1/diag(T_INV)
	ksi <- colMeans(x_data)
	priorConst1 <- array(diag(T_INV)*ksi, dim =c(p,1))
	# give some arbitrary values to the parameters:
	set.seed(1)
	mu <- array( runif(K * p), dim = c(K,p) )
	y <- array(rnorm(n = q*n), dim = c(n,q))
	SigmaINV <- array(data = 0, dim = c(p,p) )
	diag(SigmaINV) <- 0.5 + 0.5*runif(p)
	OmegaINV <- diag(q)
	# compute sufficient stats 
	suf_stat <- compute_sufficient_statistics(y = y, 
	 z = z, K = K, x_data = x_data)

	v_r <- numeric(p) #indicates the non-zero values of Lambdas
	for( r in 1:p ){
		v_r[r] <- min(r,q)
	}
	# now simulate mu and Lambda
	f2 <- compute_A_B_G_D_and_simulate_mu_Lambda(SigmaINV = SigmaINV, 
                suff_statistics = suf_stat, OmegaINV = OmegaINV, 
                K = K, priorConst1 = priorConst1, T_INV = T_INV, v_r = v_r)
	# f2$mu contains the simulated means
	# f2$Lambdas contains the simulated factor loadings




