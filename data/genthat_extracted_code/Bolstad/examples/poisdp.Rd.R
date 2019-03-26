library(Bolstad)


### Name: poisdp
### Title: Poisson sampling with a discrete prior
### Aliases: poisdp
### Keywords: misc

### ** Examples


## simplest call with an observation of 4 and a uniform prior on the
## values mu = 1,2,3
poisdp(4,1:3,c(1,1,1)/3)

##  Same as the previous example but a non-uniform discrete prior
mu = 1:3
mu.prior = c(0.3,0.4,0.3)
poisdp(4,mu=mu,mu.prior=mu.prior)

##  Same as the previous example but a non-uniform discrete prior
mu = seq(0.5,9.5,by=0.05)
mu.prior = runif(length(mu))
mu.prior = sort(mu.prior/sum(mu.prior))
poisdp(4,mu=mu,mu.prior=mu.prior)

## A random sample of 50 observations from a Poisson distribution with
## parameter mu = 3 and  non-uniform prior
y.obs = rpois(50,3)
mu = c(1:5)
mu.prior = c(0.1,0.1,0.05,0.25,0.5)
results = poisdp(y.obs, mu, mu.prior)

##  Same as the previous example but a non-uniform discrete prior
mu = seq(0.5,5.5,by=0.05)
mu.prior = runif(length(mu))
mu.prior = sort(mu.prior/sum(mu.prior))
y.obs = rpois(50,3)
poisdp(y.obs,mu=mu,mu.prior=mu.prior)





