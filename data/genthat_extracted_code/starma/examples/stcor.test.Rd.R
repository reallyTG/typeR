library(starma)


### Name: stcor.test
### Title: Space-time series non correlation test
### Aliases: stcor.test stcor.test.default print.stcor.test
### Keywords: starma estimation

### ** Examples

data(nb_mat)

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

# Test for multivariate normality
stcor.test(sim, blist)	# Data is correlated
stcor.test(eps, blist)		# Data should not be correlated (unless you're 5% unlucky)



