library(mixtools)


### Name: ise.npEM
### Title: Integrated Squared Error for a selected density from npEM output
### Aliases: ise.npEM
### Keywords: file

### ** Examples

# Mixture with mv gaussian model
set.seed(100)
m <- 2 # no. of components
r <- 3 # no. of repeated measures (coordinates)
lambda <- c(0.4, 0.6)
# Note:  Need first 2 coordinates conditionally iid due to block structure
mu <- matrix(c(0, 0, 0, 3, 3, 5), m, r, byrow=TRUE) # means 
sigma <- matrix(rep(1, 6), m, r, byrow=TRUE) # stdevs
blockid = c(1,1,2) # block structure of coordinates
n <- 200
x <- rmvnormmix(n, lambda, mu, sigma) # simulated data

# fit the model with "arbitrary" initial centers
centers <- matrix(c(0, 0, 0, 4, 4, 4), 2, 3, byrow=TRUE) 
a <- npEM(x, centers, blockid, eps=1e-8, verb=FALSE)

# Calculate integrated squared error for j=2, b=1:
j <- 2 # component
b <- 1 # block
coords <- a$blockid == b
ise.npEM(a, j, b, dnorm, lower=0, upper=10, plots=TRUE,
         mean=mu[j,coords][1], sd=sigma[j, coords][1])


# The following (lengthy) example recreates the normal multivariate 
# mixture model simulation from Benaglia et al (2009).  
mu <- matrix(c(0, 0, 0, 3, 4, 5), m, r, byrow=TRUE) 
nbrep <- 5  # Benaglia et al use 300 replications

# matrix for storing sums of Integrated Squared Errors 
ISE <- matrix(0,m,r,dimnames=list(Components=1:m, Blocks=1:r)) 

nblabsw <- 0 # no. of label switches
for (mc in 1:nbrep) {
  print(paste("REPETITION", mc))
	x <- rmvnormmix(n,lambda,mu,sigma) # simulated data
  a <- npEM(x, centers, verb=FALSE) #default:
	if (a$lambda[1] > a$lambda[2]) nblabsw <- nblabsw + 1
	for (j in 1:m) {  # for each component
		for (k in 1:r) { # for each coordinate; not assuming iid!
      # dnorm with correct mean, sd is the true density:
      ISE[j,k] <- ISE[j,k] + ise.npEM(a, j, k, dnorm, lower=mu[j,k]-5, 
               upper=mu[j,k]+5, plots=FALSE, mean=mu[j,k], 
               sd=sigma[j,k])$value
    }
  }
	MISE <- ISE/nbrep # Mean ISE
	sqMISE <- sqrt(MISE) # root-mean-integrated-squared error
}
sqMISE



