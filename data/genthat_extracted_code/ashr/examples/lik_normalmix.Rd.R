library(ashr)


### Name: lik_normalmix
### Title: Likelihood object for normal mixture error distribution
### Aliases: lik_normalmix

### ** Examples

   e = rnorm(100,0,0.8) 
   e[seq(1,100,by=2)] = rnorm(50,0,1.5) # generate e~0.5*N(0,0.8^2)+0.5*N(0,1.5^2)
   betahat = rnorm(100)+e
   ash(betahat, 1, lik=lik_normalmix(c(0.5,0.5),c(0.8,1.5)))



