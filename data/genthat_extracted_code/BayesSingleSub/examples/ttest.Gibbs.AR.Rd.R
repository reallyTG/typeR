library(BayesSingleSub)


### Name: ttest.Gibbs.AR
### Title: Obtain Bayesian t test and posterior distributions for single
###   case data
### Aliases: ttest.Gibbs.AR
### Keywords: htest models

### ** Examples

## Define data
data = c(87.5, 82.5, 53.4, 72.3, 94.2, 96.6, 57.4, 78.1, 47.2,
 80.7, 82.1, 73.7, 49.3, 79.3, 73.3, 57.3, 31.7, 50.4, 77.8,
 67, 40.5, 1.6, 38.6, 3.2, 24.1)

## Obtain log Bayes factor
logBF = ttest.Gibbs.AR(data[1:10], data[11:25])

## Obtain log Bayes factor, chains, and log interval null Bayes factor
output = ttest.Gibbs.AR(data[1:10], data[11:25], return.chains = TRUE, areaNull = c(-0.2, 0.2))

## Look at the posterior distribution of the mean
plot(output$chains[,1])

## Obtain summary statistics of posterior distributions
summary(output$chains)



