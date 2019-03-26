library(anMC)


### Name: trmvrnorm_rej_cpp
### Title: Sample from truncated multivariate normal distribution with C++
### Aliases: trmvrnorm_rej_cpp

### ** Examples

# Simulate 1000 realizations from a truncated multivariate normal vector
mu <- rep(0,10)
Sigma <- diag(rep(1,10))
upper <- rep(3,10)
lower <- rep(-0.5,10)
realizations<-trmvrnorm_rej_cpp(n=1000,mu = mu,sigma=Sigma, lower =lower, upper= upper,verb=3)
empMean<-rowMeans(realizations)
empCov<-cov(t(realizations))
# check if the sample mean is close to the actual mean
maxErrorOnMean<-max(abs(mu-empMean))
# check if we can estimate correctly the covariance matrix
maxErrorOnVar<-max(abs(rep(1,200)-diag(empCov)))
maxErrorOnCov<-max(abs(empCov[lower.tri(empCov)]))
## Not run: 
##D plot(density(realizations[1,]))
##D hist(realizations[1,],breaks="FD")
## End(Not run)



