library(AHMbook)


### Name: simNmix
### Title: Simulate data for binomial and multinomial mixture models
### Aliases: simNmix

### ** Examples

# Generate data with the default arguments and look at the structure:
tmp <- simNmix()
str(tmp)
## No test: 
str(data <- simNmix())                  # Null data-generating model
str(data <- simNmix(mean.theta = 0.60)) # ZIP with 40% structural zeroes
str(data <- simNmix(sigma.lam = 1))     # Poisson-lognormal (PLN) mixture
str(data <- simNmix(Neg.Bin = TRUE))    # Negative-binomial mixture
str(data <- simNmix(mean.theta = 0.6, sigma.lam = 1))  # Zero-inflated PLN
str(data <- simNmix(mean.theta = 0.6, Neg.Bin = TRUE)) # Zero-infl. NegBin
str(data <- simNmix(mean.p = 1))        # Perfect detection (p = 1)
str(data <- simNmix(mean.theta = 0.6, mean.p = 1))     # ZIP with p = 1
str(data <- simNmix(sigma.lam = 1, mean.p = 1))        # PLN with p = 1
## End(No test)



