library(SCBmeanfd)


### Name: scb.model
### Title: Goodness-Of-Fit of a Model for the Mean Function
### Aliases: scb.model

### ** Examples

## Example from Degras (2011)
## Gaussian process with polynomial mean function 
## and Ornstein-Uhlenbeck covariance function
## The SCB and PLRT tests are compared

set.seed(100)
p    <- 100  	# number of observation points
x 	  <- seq(0, 1, len = p)
mu	  <- 10 * x^3 - 15 * x^4 + 6 * x^5	# mean 
R 	  <- (.25)^2 * exp(20 * log(.9) * abs(outer(x,x,"-"))) # covariance 
eigR <- eigen(R, symmetric = TRUE)  	
simR <- eigR$vectors %*% diag(sqrt(eigR$values)) 	 

# Candidate model for mu: polynomial of degree <= 3
# This model, although incorrect, closely approximates mu.
# With n = 50 curves, the SCB and PLRT incorrectly retain the model.
# With n = 70 curves, both tests reject it. 
n <- 50  
y <- mu + simR %*% matrix(rnorm(n*p), p, n) 	# simulate data  
y <- t(y) 	# arrange the trajectories in rows
h <- cv.select(x, y, 1)	
scb.model(x, y, 3, bandwidth = h)		  # p value: .652
plrt.model(x, y, 3, verbose = TRUE)	# p value: .450 
n <- 70  	
y <- mu + simR %*% matrix(rnorm(n*p), p, n) 		
y <- t(y) 										
h <- cv.select(x, y, 1)	
scb.model(x, y, 3, bandwidth = h)		  # p value: .004
plrt.model(x, y, 3, verbose = TRUE)	# p value: .001

# Correct model: polynomials of degree <= 5
scb.model(x, y, 5, bandwidth = h)  	# p value: .696
plrt.model(x, y, 5, verbose = TRUE)	# p value: .628




