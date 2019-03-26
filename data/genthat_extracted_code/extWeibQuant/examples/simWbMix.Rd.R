library(extWeibQuant)


### Name: simWbMix
### Title: Simulate data from a mixture of two Weibull distributions
### Aliases: simWbMix
### Keywords: Weibull Mixture

### ** Examples

mmix = rbind(c(0.7, 5, 7),c(0.3, 15, 6))
set.seed(1)
y <- sort(simWbMix(300, mmix)) #Generate the data
hist(y)



