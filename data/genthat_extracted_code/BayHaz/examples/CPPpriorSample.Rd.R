library(BayHaz)


### Name: CPPpriorSample
### Title: Function to Sample Hazard Rates from CPP Priors
### Aliases: CPPpriorSample
### Keywords: distribution survival smooth

### ** Examples

# set RNG seed (for example reproducibility only)
set.seed(1234)

# select a CPP prior distribution
hypars<-CPPpriorElicit(r0 = 0.1, H = 1, T00 = 50, M00 = 2)

# generate a sample of ten hazard rates
prior<-CPPpriorSample(ss = 10, hyp = hypars)



