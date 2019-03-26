library(RcmdrPlugin.TeachStat)


### Name: MKV.test
### Title: Z-test for the mean of a Normal variable with known population
###   variance.
### Aliases: MKV.test

### ** Examples

data(cars93) # Dataset provided with the package
# Mean maximum price (MaxPrice) less than 20 thousand $ assuming that the 
# variance is known and equal to 11
MKV.test(cars93$MaxPrice, sd=11, alternative="less", mu=20, conf.level=0.95)




