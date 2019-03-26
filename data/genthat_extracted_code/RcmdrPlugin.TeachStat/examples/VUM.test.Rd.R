library(RcmdrPlugin.TeachStat)


### Name: VUM.test
### Title: Chi-square test for the variance of a Normal variable with
###   unknown population mean.
### Aliases: VUM.test

### ** Examples

data(cars93) # Dataset provided with the package
# Variance of the maximum price (MaxPrice) assuming that the population mean 
# price is unknown
VUM.test(cars93$MaxPrice, alternative="two.sided", sigma=11, conf.level=0.95)



