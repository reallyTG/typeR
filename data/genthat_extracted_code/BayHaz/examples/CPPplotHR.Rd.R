library(BayHaz)


### Name: CPPplotHR
### Title: Function to Plot CPP Hazard Rates
### Aliases: CPPplotHR
### Keywords: hplot survival

### ** Examples

# set RNG seed (for example reproducibility only)
set.seed(1234)

# select a CPP prior distribution
hypars<-CPPpriorElicit(r0 = 0.1, H = 1, T00 = 50, M00 = 2)
# generate a sample of ten hazard rates
prior<-CPPpriorSample(ss = 10, hyp = hypars)

# plot the ten hazard rates
CPPplotHR(prior, tu = "Year")

# load a data set
data(earthquakes)
# generate a posterior sample
post<-CPPpostSample(hypars, times = earthquakes$ti, obs = earthquakes$ob)

# plot some posterior hazard rate summaries
CPPplotHR(post, tu = "Year")



