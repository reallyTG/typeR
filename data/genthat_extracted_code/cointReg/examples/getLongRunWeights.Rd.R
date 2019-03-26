library(cointReg)


### Name: getLongRunWeights
### Title: Weights for Long-Run Variance
### Aliases: getLongRunWeights

### ** Examples

lrw.ba = cointReg:::getLongRunWeights(100, kernel = "ba", bandwidth = 25)
plot(lrw.ba$w)




