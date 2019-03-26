library(sppmix)


### Name: GetBMA
### Title: Compute the Bayesian Model average
### Aliases: GetBMA

### ** Examples

## No test: 
fit=est_mix_bdmcmc(pp = spatstat::redwood, m = 5)
BMA=GetBMA(fit)
burnin=.1*fit$L
title1 = paste("Bayesian model average of",fit$L-burnin,"posterior realizations")
plotmix_3d(BMA,title1=title1)
plot_density(as.data.frame(BMA))+ggplot2::ggtitle("Bayesian model average intensity surface")
plot_density(as.data.frame(BMA),TRUE)+ggplot2::ggtitle(
 "Contours of the Bayesian model average intensity surface")
## End(No test)




