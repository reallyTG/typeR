library(starma)


### Name: starma-package
### Title: Space Time AutoRegressive Moving Average (STARMA) modelling for
###   space-time series
### Aliases: starma-package
### Keywords: package starma space-time

### ** Examples

# Load spdep library to easily create weight matrices
library(spdep)

# Create a 5x5 regular grid which will be our lattice
sites <- matrix(0, 25, 2)
for (i in 1:5) {
	for (j in 1:5)
		sites[(i-1)*5 + j, ] <- c(i, j) - .5
}
plot(sites)

# Create a uniform first order neighbourhood
knb <- dnearneigh(sites, 0, 1)
plot(knb, sites)

# Lag the neighbourhood to create other order matrices
knb <- nblag(knb, 4)
klist <- list(order0=diag(25),
           order1=nb2mat(knb[[1]]),
           order2=nb2mat(knb[[2]]),
           order3=nb2mat(knb[[3]]),
           order4=nb2mat(knb[[4]]))
		   
# Simulate a STARMA(2;1) process
eps <- matrix(rnorm(200*25), 200, 25)
star <- eps
for (t in 3:200) {
	star[t,] <- (.4*klist[[1]] + .25*klist[[2]]) %*% star[t-1,] +
		(.25*klist[[1]]                ) %*% star[t-2,] +
		(            - .3*klist[[2]]) %*% eps[t-1,] +
		eps[t, ]
}

star <- star[101:200,]	# Remove first observations
star <- stcenter(star)	# Center and scale the dataset
										   
# Identify the process
stacf(star, klist)
stpacf(star, klist)

# Estimate the process
ar <- matrix(c(1, 1, 1, 0), 2, 2)
ma <- matrix(c(0, 1), 1, 2)
model <- starma(star, klist, ar, ma)
model
summary(model)

# Diagnose the process
stcor.test(model$residuals, klist, fitdf=4)
stacf(model$residuals, klist)
stpacf(model$residuals, klist)



