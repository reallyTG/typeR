library(SCBmeanfd)


### Name: plrt.model
### Title: Pseudo-Likelihood Ratio Test for Models of the Mean Function
### Aliases: plrt.model

### ** Examples

## Example: Gaussian process with mean = linear function + bump 
## and Onstein-Uhlenbeck covariance. The bump is high in the y   
## direction and narrow in the x direction. The SCB and PLRT 
## tests are compared.

# The departure from linearity in the mean function is strong  
# in the supremum norm (SCB test) but mild in the euclidean norm 
# (PLRT). With either n = 20 or n = 100 curves, the SCB test 
# strongly rejects the incorrect linear model for the mean 
# function while the PLRT retains it. 

p    <- 100    # number of observation points
x 	  <- seq(0, 1, len = p)
mu <- -1 + 1.5 * x + 0.2 * dnorm(x, .6, .02) 
plot(x, mu, type = "l")
R 	  <- (.25)^2 * exp(20 * log(.9) * abs(outer(x,x,"-"))) # covariance 
eigR <- eigen(R, symmetric = TRUE)  	
simR <- eigR$vectors %*% diag(sqrt(eigR$values)) 	 

n  <- 20
set.seed(100)
y  <- mu + simR %*% matrix(rnorm(n*p), p, n) 		
y  <- t(y) 	
points(x, colMeans(y))									
h  <- cv.select(x, y, 1)	
scb.model(x, y, 1, bandwidth = h)		 # p value: <1e-16
plrt.model(x, y, 1, verbose = TRUE)	# p value: .442
n  <- 100
y  <- mu + simR %*% matrix(rnorm(n*p), p, n) 		
y  <- t(y) 	
h  <- cv.select(x, y, 1)	
scb.model(x, y, 1, bandwidth = h)		 # p value: <1e-16
plrt.model(x, y, 1, verbose = TRUE)	# p value: .456



