library(MVT)


### Name: kurtosis
### Title: Mardia's multivariate kurtosis coefficient
### Aliases: kurtosis
### Keywords: multivariate

### ** Examples

data(companies)
S <- cov(companies)
kurtosis(companies, colMeans(companies), S)



