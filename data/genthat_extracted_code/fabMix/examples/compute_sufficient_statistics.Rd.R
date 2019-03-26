library(fabMix)


### Name: compute_sufficient_statistics
### Title: Compute sufficient statistics
### Aliases: compute_sufficient_statistics

### ** Examples

        data(waveDataset1500)
        x_data <- as.matrix(waveDataset1500[ 1:20, -1]) # data
        z <-  waveDataset1500[ 1:20, 1] # class
        p <- dim(x_data)[2]
        n <- dim(x_data)[1]
        q <- 2
        K <- length(table(z))           # 3 classes
        # give some arbitrary values to the parameters:
        set.seed(1)
	y <- array(rnorm(n = q*n), dim = c(n,q))
	# compute sufficient stats 
	suf_stat <- compute_sufficient_statistics(y = y, 
	 z = z, K = K, x_data = x_data)



