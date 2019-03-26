library(wiqid)


### Name: Bayesian SCR
### Title: Spatially explicit capture-recapture (secr) density estimation
###   using MCMC
### Aliases: Bsecr0

### ** Examples

## No test: 
# The stoats data set in 'secr'
require(secr)
data(stoatDNA)
# This takes ca 10 mins on a multicore machine:
Bout <- Bsecr0(stoatCH, buffer=1000)
Bout
plot(Bout)
# look at diagnostic plots to see if D is constrained by nAug:
tracePlot(Bout)
densityPlot(Bout)  # Upper values of D doesn't look constrained.
## End(No test)



