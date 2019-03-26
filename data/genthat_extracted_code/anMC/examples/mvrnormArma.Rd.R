library(anMC)


### Name: mvrnormArma
### Title: Sample from multivariate normal distribution with C++
### Aliases: mvrnormArma

### ** Examples

# Simulate 1000 realizations from a multivariate normal vector
mu <- rep(0,200)
Sigma <- diag(rep(1,200))
realizations<-mvrnormArma(n=1000,mu = mu,sigma=Sigma, chol=0)
empMean<-rowMeans(realizations)
empCov<-cov(t(realizations))
# check if the sample mean is close to the actual mean
maxErrorOnMean<-max(abs(mu-empMean))
# check if we can estimate correctly the covariance matrix
maxErrorOnVar<-max(abs(rep(1,200)-diag(empCov)))
maxErrorOnCov<-max(abs(empCov[lower.tri(empCov)]))
## Not run: 
##D plot(density(realizations[2,]))
## End(Not run)



