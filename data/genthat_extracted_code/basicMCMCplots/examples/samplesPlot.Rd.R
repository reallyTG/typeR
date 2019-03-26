library(basicMCMCplots)


### Name: samplesPlot
### Title: Plot MCMC traceplots and density plots
### Aliases: samplesPlot

### ** Examples

samples <- cbind(rnorm(1000), rgamma(1000, 1))
colnames(samples) <- c('alpha', 'beta')
samplesPlot(samples)




