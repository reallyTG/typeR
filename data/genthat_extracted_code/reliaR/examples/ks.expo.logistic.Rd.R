library(reliaR)


### Name: ks.expo.logistic
### Title: Test of Kolmogorov-Smirnov for the Exponentiated Logistic (EL)
###   distribution
### Aliases: ks.expo.logistic
### Keywords: htest

### ** Examples


## Load data sets
data(dataset2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(dataset2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 5.31302, beta.est = 139.04515

ks.expo.logistic(dataset2, 5.31302, 139.04515, alternative = "two.sided", plot = TRUE)



