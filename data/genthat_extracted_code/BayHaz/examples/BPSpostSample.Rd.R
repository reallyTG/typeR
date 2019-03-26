library(BayHaz)


### Name: BPSpostSample
### Title: Function to Sample Hazard Rates from BPS Posteriors
### Aliases: BPSpostSample
### Keywords: distribution survival smooth

### ** Examples

# set RNG seed (for example reproducibility only)
set.seed(1234)

# select a BPS prior distribution
hypars<-BPSpriorElicit(r0 = 0.1, H = 1, T00 = 50, ord = 4, G = 3, c = 0.9)
# load a data set
data(earthquakes)

# find the posterior mode
postmode<-BPSpostSample(hypars, times = earthquakes$ti, obs = earthquakes$ob, mclen = 0)
# evaluate the posterior mode hazard rate at year multiples
BPSevalHR(time = seq(0,50), sample = postmode)

# generate a posterior sample
post<-BPSpostSample(hypars, times = earthquakes$ti, obs = earthquakes$ob, etastar = postmode$etastar)
# plot some posterior hazard rate summaries
BPSplotHR(post, tu = "Year")



