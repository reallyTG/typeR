library(reliaR)


### Name: qq.expo.logistic
### Title: Quantile versus quantile (QQ) plot for the Exponentiated
###   Logistic(EL) distribution
### Aliases: qq.expo.logistic
### Keywords: hplot

### ** Examples

## Load data sets
data(dataset2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(dataset2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 5.31302, beta.est = 139.04515

qq.expo.logistic(dataset2, 5.31302, 139.04515, main = " ", line.qt = FALSE)



