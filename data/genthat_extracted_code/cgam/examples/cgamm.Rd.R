library(cgam)


### Name: cgamm
### Title: Constrained Generalized Additive Mixed-Effects Model Fitting
### Aliases: cgamm
### Keywords: cgamm routine

### ** Examples

# Example 1.

# simulate a balanced data set with 30 clusters 
# each cluster has 30 data points	
	n <- 30
	m <- 30

# the standard deviation of between cluster error terms is 1 
# the standard deviation of within cluster error terms is 2
	sige <- 1
	siga <- 2

# generate a continuous predictor
	x <- 1:(m*n)
	for(i in 1:m) {
		x[(n*(i-1)+1):(n*i)] <- round(runif(n), 3)
	}
# generate a group factor
	group <- trunc(0:((m*n)-1)/n)+1

# generate the fixed-effect term
	mu <- 10*exp(10*x-5)/(1+exp(10*x-5))
	
# generate the random-intercept term asscosiated with each group
	avals <- rnorm(m, 0, siga)

# generate the response 
	y <- 1:(m*n)
	for(i in 1:m){
		y[group == i] <- mu[group == i] + avals[i] + rnorm(n, 0, sige)
	}

# use REML method to fit the model
	ans <- cgamm(y ~ s.incr(x) + (1|group), reml=TRUE)	
	muhat <- ans$muhat
	
	plot(x, y, col = group, cex = .6)
	lines(sort(x), mu[order(x)], lwd = 2)
	lines(sort(x), muhat[order(x)], col = 2, lty = 2, lwd = 2)	
	legend("topleft", bty = "n", c("true fixed-effect term", "cgamm fit"), 
	col = c(1, 2), lty = c(1, 2), lwd = c(2, 2))	



