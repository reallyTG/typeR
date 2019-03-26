library(lmom)


### Name: cdfpe3
### Title: Pearson type III distribution
### Aliases: cdfpe3 quape3
### Keywords: distribution

### ** Examples

# Random sample from the Pearson type III distribution
# with parameters mu=1, alpha=2, gamma=3.
quape3(runif(100), c(1,2,3))

# The Pearson type III distribution with parameters
# mu=12, sigma=6, gamma=1, is the gamma distribution
# with parameters alpha=4, beta=3.  An illustration:
fval<-seq(0.1,0.9,by=0.1)
cbind(fval, qgamma(fval, shape=4, scale=3), quape3(fval, c(12,6,1)))



