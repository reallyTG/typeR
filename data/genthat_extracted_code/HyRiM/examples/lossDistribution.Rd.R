library(HyRiM)


### Name: lossDistribution
### Title: construction and handling of loss distributions
### Aliases: lossDistribution print.mosg.lossdistribution
###   summary.mosg.lossdistribution plot.mosg.lossdistribution
###   quantile.mosg.lossdistribution mean.mosg.lossdistribution
###   density.mosg.lossdistribution print.summary.mosg.lossdistribution

### ** Examples

cvss1base <- c(10,6.4,9,7.9,7.1,9)
ld <- lossDistribution(cvss1base)
summary(ld)
plot(ld)
# for further examples, see the documentation to 'mosg' and 'mosg.equilibrium'



