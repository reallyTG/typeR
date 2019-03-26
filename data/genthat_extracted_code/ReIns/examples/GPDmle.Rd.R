library(ReIns)


### Name: GPDmle
### Title: GPD-ML estimator
### Aliases: GPDmle POT

### ** Examples

data(soa)

# Look at last 500 observations of SOA data
SOAdata <- sort(soa$size)[length(soa$size)-(0:499)]

# Plot GPD-ML estimates as a function of k
GPDmle(SOAdata, plot=TRUE)



