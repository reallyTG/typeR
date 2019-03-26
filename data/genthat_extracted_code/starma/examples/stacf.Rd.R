library(starma)


### Name: stacf
### Title: Space-time autocorrelation functions
### Aliases: stacf stpacf
### Keywords: starma identification diagnostic acf stacf pacf stpacf

### ** Examples

data(nb_mat)	# Get neighbourhood matrices

# Simulate a STARMA model
eps <- matrix(rnorm(94*200), 200, 94)
sim <- eps
for (t in 3:200) {
	sim[t,] <- (.4*blist[[1]] + .25*blist[[2]]) %*% sim[t-1,] +
		(.25*blist[[1]]                ) %*% sim[t-2,] +
		(            - .3*blist[[2]]) %*% eps[t-1,] +
		eps[t, ]
}

sim <- sim[101:200,]
sim <- stcenter(sim)	# Center and scale the dataset

# Plot stacf and stpacf
stacf(sim, blist)
stpacf(sim, blist)



