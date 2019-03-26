library(BayesSingleSub)


### Name: trendtest.MC.AR
### Title: Obtain Bayesian trend test or single case data
### Aliases: trendtest.MC.AR
### Keywords: htest models

### ** Examples

## Define data
data = c(87.5, 82.5, 53.4, 72.3, 94.2, 96.6, 57.4, 78.1, 47.2,
 80.7, 82.1, 73.7, 49.3, 79.3, 73.3, 57.3, 31.7, 50.4, 77.8,
 67, 40.5, 1.6, 38.6, 3.2, 24.1)

## Obtain log Bayes factors
logBFs = trendtest.MC.AR(data[1:10], data[11:25])



