library(wiqid)


### Name: Bayesian normal estimation
### Title: Bayesian modelling of a normal (Gaussian) distribution
### Aliases: Bnormal Bnormal2

### ** Examples

# Generate a sample from a normal distribution, maybe the head-body length of a
#   carnivore in mm:
HB <- rnorm(10, 900, 15)
Bnormal(HB)  # with improper flat priors for mu and tau
Bnormal(HB, priors=list(muMean=1000, muSD=200))
Bnormal(HB, priors=list(muMean=1, muSD=0.2)) # a silly prior produces a warning.
## No test: 
Bnormal2(HB)  # with broad normal prior for mu, uniform for sigma
Bnormal2(HB, priors=list(muMean=1000, muSD=200, sigmaMode=20, sigmaSD=10))
## End(No test) 



