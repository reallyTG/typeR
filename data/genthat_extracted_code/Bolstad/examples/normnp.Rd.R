library(Bolstad)


### Name: normnp
### Title: Bayesian inference on a normal mean with a normal prior
### Aliases: normnp
### Keywords: misc

### ** Examples


## generate a sample of 20 observations from a N(-0.5,1) population
x = rnorm(20,-0.5,1)

## find the posterior density with a N(0,1) prior on mu
normnp(x,sigma=1)

## find the posterior density with N(0.5,3) prior on mu
normnp(x,0.5,3,1)

## Find the posterior density for mu, given a random sample of 4
## observations from N(mu,sigma^2=1), y = [2.99, 5.56, 2.83, 3.47],
## and a N(3,sd=2)$ prior for mu
y = c(2.99,5.56,2.83,3.47)
normnp(y,3,2,1)




