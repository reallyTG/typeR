library(reliaR)


### Name: ExpoLogistic
### Title: The Exponentiated Logistic(EL) distribution
### Aliases: ExpoLogistic dexpo.logistic pexpo.logistic qexpo.logistic
###   rexpo.logistic
### Keywords: distribution

### ** Examples

## Load data sets
data(dataset2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(dataset2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 5.31302, beta.est = 139.04515

dexpo.logistic(dataset2, 5.31302, 139.04515, log = FALSE)
pexpo.logistic(dataset2, 5.31302, 139.04515, lower.tail = TRUE, log.p = FALSE)
qexpo.logistic(0.25, 5.31302, 139.04515, lower.tail=TRUE, log.p = FALSE)
rexpo.logistic(30, 5.31302, 139.04515)



