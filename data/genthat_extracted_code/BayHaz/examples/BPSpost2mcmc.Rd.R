library(BayHaz)


### Name: BPSpost2mcmc
### Title: Function to Convert BPS Posterior Samples into MCMC Objects
### Aliases: BPSpost2mcmc
### Keywords: misc

### ** Examples

# set RNG seed (for example reproducibility only)
set.seed(1234)

# select a BPS prior distribution
hypars<-BPSpriorElicit(r0 = 0.1, H = 1, T00 = 50, ord = 4, G = 3, c = 0.9)
# load a data set
data(earthquakes)
# generate a posterior sample
post<-BPSpostSample(hypars, times = earthquakes$ti, obs = earthquakes$ob)

# convert the posterior sample into an MCMC object
MCMCpost<-BPSpost2mcmc(post)



