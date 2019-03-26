library(sigclust)


### Name: sigclust
### Title: Statistical Significance of Clustering
### Aliases: sigclust
### Keywords: htest

### ** Examples

## Simulate a dataset from a collection of mixtures of two
## multivariate Gaussian distribution with different means.

mu <- 5
n <- 30
p <- 500
dat <- matrix(rnorm(p*2*n),2*n,p)
dat[1:n,1] <- dat[1:n,1]+mu
dat[(n+1):(2*n),1] <- dat[(n+1):(2*n),1]-mu

nsim <- 1000
nrep <- 1
icovest <- 3
pvalue <- sigclust(dat,nsim=nsim,nrep=nrep,labflag=0,icovest=icovest)
#sigclust plot
plot(pvalue)




