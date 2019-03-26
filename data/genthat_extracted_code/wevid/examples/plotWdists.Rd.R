library(wevid)


### Name: plotWdists
### Title: Plot the distribution of the weight of evidence in cases and in
###   controls
### Aliases: plotWdists

### ** Examples

data(cleveland)
densities <- with(cleveland, Wdensities(y, posterior.p, prior.p))
plotWdists(densities)

# Example which requires fitting a mixture distribution
data(fitonly)
densities <- with(fitonly, Wdensities(y, posterior.p, prior.p,
                                      in.spike=posterior.p < 0.1))

# truncate spike
plotWdists(densities) + ggplot2::scale_y_continuous(limits=c(0, 0.5))




