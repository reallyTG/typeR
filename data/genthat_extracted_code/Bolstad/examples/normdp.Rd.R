library(Bolstad)


### Name: normdp
### Title: Bayesian inference on a normal mean with a discrete prior
### Aliases: normdp
### Keywords: misc

### ** Examples


## generate a sample of 20 observations from a N(-0.5,1) population
x = rnorm(20,-0.5,1)

## find the posterior density with a uniform prior on mu
normdp(x,1)

## find the posterior density with a non-uniform prior on mu
mu = seq(-3,3,by=0.1)
mu.prior = runif(length(mu))
mu.prior = sort(mu.prior/sum(mu.prior))
normdp(x,1,mu,mu.prior)

## Let mu have the discrete distribution with 5 possible
## values, 2, 2.5, 3, 3.5 and 4, and associated prior probability of
## 0.1, 0.2, 0.4, 0.2, 0.1 respectively. Find the posterior
## distribution after a drawing random sample of n = 5 observations
## from a N(mu,1) distribution y = [1.52, 0.02, 3.35, 3.49, 1.82]
mu = seq(2,4,by=0.5)
mu.prior = c(0.1,0.2,0.4,0.2,0.1)
y = c(1.52,0.02,3.35,3.49,1.82)
normdp(y,1,mu,mu.prior)




