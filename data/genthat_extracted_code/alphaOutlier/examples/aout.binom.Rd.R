library(alphaOutlier)


### Name: aout.binom
### Title: Find alpha-outliers in Binomial data
### Aliases: aout.binom
### Keywords: distribution

### ** Examples

data(uis)
medbeck <- median(uis$BECK) 
aout.binom(data = uis$BECK, param = c(54, medbeck/54), alpha = 0.001)



