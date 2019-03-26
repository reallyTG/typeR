library(glassoFast)


### Name: glassoFast
### Title: Fast graphical LASSO
### Aliases: glassoFast
### Keywords: glasso covariance matrix regularization penalized likelihood

### ** Examples


set.seed(100)

# Make a random covariance matrix
p=5
x<-matrix(rnorm(p*p),ncol=p)
s<- var(x)

# Compute the LASSO estimates
glassoFast(s, rho=.1)

# compare with glasso
## No test: 
 require(glasso)
 glasso(s, rho=.1)

# benchmark glassoFast and glasso
 require(rbenchmark)
 p=100
 x<-matrix(rnorm(p*p),ncol=p)
 s<- var(x)
 benchmark(glassoFast(s, rho=.15), glasso(s, rho=.15), replications = 100)
 # up to an order of magnitude faster
	
## End(No test)



