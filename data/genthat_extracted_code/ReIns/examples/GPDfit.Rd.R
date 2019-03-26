library(ReIns)


### Name: GPDfit
### Title: Fit GPD using MLE
### Aliases: GPDfit

### ** Examples

data(soa)

# Look at last 500 observations of SOA data
SOAdata <- sort(soa$size)[length(soa$size)-(0:499)]

# Fit GPD to last 500 observations
res <- GPDfit(SOAdata-sort(soa$size)[500])



