library(reliaR)


### Name: pp.expo.logistic
### Title: Probability versus Probability (PP) plot for the Exponentiated
###   Logistic(EL) distribution
### Aliases: pp.expo.logistic
### Keywords: hplot

### ** Examples

## Load data sets
data(dataset2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(dataset2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 5.31302, beta.est = 139.04515

pp.expo.logistic(dataset2, 5.31302, 139.04515, main = " ", line = TRUE)



