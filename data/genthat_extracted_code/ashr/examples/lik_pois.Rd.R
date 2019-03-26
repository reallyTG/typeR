library(ashr)


### Name: lik_pois
### Title: Likelihood object for Poisson error distribution
### Aliases: lik_pois

### ** Examples

   beta = c(rnorm(100,50,5)) # prior mode: 50
   y = rpois(100,beta) # simulate Poisson observations
   ash(rep(0,length(y)),1,lik=lik_pois(y))



