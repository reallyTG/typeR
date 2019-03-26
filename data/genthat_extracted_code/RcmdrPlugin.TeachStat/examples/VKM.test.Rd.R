library(RcmdrPlugin.TeachStat)


### Name: VKM.test
### Title: Chi-square test for the variance of a Normal variable with known
###   population mean.
### Aliases: VKM.test

### ** Examples

data(cars93) # Dataset provided with the package
# Variance of the maximum price (MaxPrice) assuming that the population mean
# price is known and equal to 22
VKM.test(cars93$MaxPrice, alternative="two.sided", sigma=11, mu=22, conf.level=0.95)



