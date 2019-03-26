library(BayHaz)


### Name: CPPevalHR
### Title: Function to Evaluate CPP Hazard Rates
### Aliases: CPPevalHR
### Keywords: survival

### ** Examples

# set RNG seed (for example reproducibility only)
set.seed(1234)

# select a CPP prior distribution
hypars<-CPPpriorElicit(r0 = 0.1, H = 1, T00 = 50, M00 = 2)
# generate a sample of ten hazard rates
prior<-CPPpriorSample(ss = 10, hyp = hypars)

# evaluate the ten hazard rates at year multiples
CPPevalHR(time = seq(0,50), sample = prior)

# load a data set
data(earthquakes)
# generate a posterior sample
post<-CPPpostSample(hypars, times = earthquakes$ti, obs = earthquakes$ob)

# evaluate the posterior hazard rates at year multiples
CPPevalHR(time = seq(0,50), sample = post)



