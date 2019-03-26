library(BayHaz)


### Name: CPPpost2mcmc
### Title: Function to Convert CPP Posterior Samples into MCMC Objects
### Aliases: CPPpost2mcmc
### Keywords: misc

### ** Examples

# set RNG seed (for example reproducibility only)
set.seed(1234)

# select a CPP prior distribution
hypars<-CPPpriorElicit(r0 = 0.1, H = 1, T00 = 50, M00 = 2)
# load a data set
data(earthquakes)
# generate a posterior sample
post<-CPPpostSample(hypars, times = earthquakes$ti, obs = earthquakes$ob)

# convert the posterior sample into an MCMC object
MCMCpost<-CPPpost2mcmc(post)



