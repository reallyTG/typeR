library(extWeibQuant)


### Name: quanWbMix
### Title: Calculate the quantiles of a mixture of two Weibull
###   distributions.
### Aliases: quanWbMix
### Keywords: Quantile Weibull mixture

### ** Examples

mmix = rbind(c(0.7, 5, 7),c(0.3, 15, 6))
quanWbMix(c(0.1, 0.5, 0.7), mmix)
quanWbMix(0.1, mmix)



