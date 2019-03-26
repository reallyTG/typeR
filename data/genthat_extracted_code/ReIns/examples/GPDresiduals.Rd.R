library(ReIns)


### Name: GPDresiduals
### Title: GPD residual plot
### Aliases: GPDresiduals

### ** Examples

data(soa)

# Look at last 500 observations of SOA data
SOAdata <- sort(soa$size)[length(soa$size)-(0:499)]

# Plot POT-MLE estimates as a function of k
pot <- GPDmle(SOAdata, plot=TRUE)

# Residual plot
k <- 200
GPDresiduals(SOAdata, sort(SOAdata)[length(SOAdata)-k], pot$gamma[k], pot$sigma[k])



