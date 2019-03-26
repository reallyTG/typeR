library(fabMix)


### Name: compute_sufficient_statistics_q0
### Title: Compute sufficient statistics for q = 0
### Aliases: compute_sufficient_statistics_q0

### ** Examples

        data(waveDataset1500)
        x_data <- as.matrix(waveDataset1500[ 1:20, -1]) # data
        z <-  waveDataset1500[ 1:20, 1] # class
        p <- dim(x_data)[2]
        n <- dim(x_data)[1]
        q <- 2
        K <- length(table(z))           # 3 classes
	# compute sufficient stats 
	suf_stat <- compute_sufficient_statistics_q0(
	 z = z, K = K, x_data = x_data)



