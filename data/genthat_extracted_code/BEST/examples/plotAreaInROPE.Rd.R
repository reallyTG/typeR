library(BEST)


### Name: plotAreaInROPE
### Title: Area of the posterior density in the ROPE as a function of its
###   width.
### Aliases: plotAreaInROPE
### Keywords: hplot

### ** Examples

# Generate a fake MCMC posterior for effect size and plot it:
mcmcChain <- rnorm(50000,0.03,0.025)
plotPost(mcmcChain, compVal=0, ROPE=c(-0.1, 0.1))

# How does the mass within the ROPE vary with ROPE radius?
plotAreaInROPE(mcmcChain, credMass = 0.95, compVal = 0,
  maxROPEradius = 0.15)

## No test: 
# Generate real MCMC chains, takes up to 1 min:
y1 <- c(4.77, 4.33, 3.59, 3.33, 2.66, 3.48)
y2 <- c(3.88, 3.55, 3.29, 2.59, 2.33, 3.59)
BESTout <- BESTmcmc(y1, y2)
plot(BESTout)

meanDiff <- BESTout$mu1 - BESTout$mu2
plotAreaInROPE(meanDiff, credMass = 0.95, compVal = 0,
  maxROPEradius = 3)
## End(No test)



