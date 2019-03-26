library(ashr)


### Name: lik_binom
### Title: Likelihood object for Binomial error distribution
### Aliases: lik_binom

### ** Examples

   p = rbeta(100,2,2) # prior mode: 0.5
   n = rpois(100,10)
   y = rbinom(100,n,p) # simulate Binomial observations
   ash(rep(0,length(y)),1,lik=lik_binom(y,n))



