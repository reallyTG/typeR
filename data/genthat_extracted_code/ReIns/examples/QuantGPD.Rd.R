library(ReIns)


### Name: QuantGPD
### Title: Estimator of extreme quantiles using GPD-MLE
### Aliases: QuantGPD

### ** Examples

data(soa)

# Look at last 500 observations of SOA data
SOAdata <- sort(soa$size)[length(soa$size)-(0:499)]

# GPD-ML estimator
pot <- GPDmle(SOAdata)

# Large quantile
p <- 10^(-5)
QuantGPD(SOAdata, p=p, gamma=pot$gamma, sigma=pot$sigma, plot=TRUE)



