library(BayHaz)


### Name: CPPpostSample
### Title: Function to Sample Hazard Rates from CPP Posteriors
### Aliases: CPPpostSample
### Keywords: distribution survival smooth

### ** Examples

# set RNG seed (for example reproducibility only)
set.seed(1234)

# select a CPP prior distribution
hypars<-CPPpriorElicit(r0 = 0.1, H = 1, T00 = 50, M00 = 2)
# load a data set
data(earthquakes)

# generate a posterior sample
post<-CPPpostSample(hypars, times = earthquakes$ti, obs = earthquakes$ob)



