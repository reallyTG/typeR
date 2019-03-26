library(reliaR)


### Name: ExpoLogisticsurvival
### Title: Survival related functions for the Exponentiated Logistic(EL)
###   distribution
### Aliases: ExpoLogisticsurvival crf.expo.logistic hexpo.logistic
###   hra.expo.logistic sexpo.logistic
### Keywords: survival

### ** Examples

## load data set
data(dataset2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(dataset2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 5.31302, beta.est = 139.04515

## Reliability indicators for data(dataset2):

## Reliability function
sexpo.logistic(dataset2, 5.31302, 139.04515)

## Hazard function
hexpo.logistic(dataset2, 5.31302, 139.04515)

## hazard rate average(hra)
hra.expo.logistic(dataset2, 5.31302, 139.04515)

## Conditional reliability function (age component=0)
crf.expo.logistic(dataset2, 0.00, 5.31302, 139.04515)

## Conditional reliability function (age component=3.0)
crf.expo.logistic(dataset2, 3.0, 5.31302, 139.04515)



