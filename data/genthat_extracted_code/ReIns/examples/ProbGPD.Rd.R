library(ReIns)


### Name: ProbGPD
### Title: Estimator of small exceedance probabilities and large return
###   periods using GPD-MLE
### Aliases: ProbGPD ReturnGPD

### ** Examples

data(soa)

# Look at last 500 observations of SOA data
SOAdata <- sort(soa$size)[length(soa$size)-(0:499)]

# GPD-ML estimator
pot <- GPDmle(SOAdata)

# Exceedance probability
q <- 10^7
ProbGPD(SOAdata, gamma=pot$gamma, sigma=pot$sigma, q=q, plot=TRUE)

# Return period
q <- 10^7
ReturnGPD(SOAdata, gamma=pot$gamma, sigma=pot$sigma, q=q, plot=TRUE)



