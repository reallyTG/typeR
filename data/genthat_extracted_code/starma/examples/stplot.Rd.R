library(starma)


### Name: stplot
### Title: Plot for space-time series autocorrelation functions
### Aliases: stplot
### Keywords: starma plot

### ** Examples

data(nb_mat)	# Get neighbourhood matrices

# Simulate a STARMA model
eps <- matrix(rnorm(94*200), 200, 94)
sim <- eps
for (t in 3:200) {
	sim[t,] <- (.4*diag(94) + .25*blist[[2]]) %*% sim[t-1,] +
		(.25*diag(94)                ) %*% sim[t-2,] +
		(            - .3*blist[[2]]) %*% eps[t-1,] +
		eps[t, ]
}

sim <- sim[101:200,]
sim <- stcenter(sim)	# Center and scale the dataset

# Autocorrelation functions
sim.stacf <- stacf(sim, blist, plot=FALSE)

# Plot the autocorrelation function
stplot(sim.stacf, 2 / sqrt(nrow(sim) * ncol(sim)), "stacf(sim, blist)")



