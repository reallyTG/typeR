library(wevid)


### Name: Wdensities
### Title: Compute densities of weights of evidence in cases and controls
### Aliases: Wdensities

### ** Examples

data(cleveland)
densities <- with(cleveland, Wdensities(y, posterior.p, prior.p))

# Example which requires fitting a mixture distribution
data(fitonly)
densities <- with(fitonly, Wdensities(y, posterior.p, prior.p,
                                      in.spike=posterior.p < 0.1))




