library(starma)


### Name: summary.starma
### Title: Summary method for space-time series fitted models
### Aliases: summary.starma summary.starma print.summary.starma
### Keywords: starma summary summary.starma

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

# Select parameters to estimate
ar <- matrix(0, 2, 2)
ar[ ,1] <- 1	# phi10 and phi20
ar[1,2] <- 1	# phi11
ma <- matrix(c(0,1), 1, 2)	# theta11

# Run the Kalman filter algorithm
model <- starma(sim, blist, ar, ma)

# Get summary
summary(model)



