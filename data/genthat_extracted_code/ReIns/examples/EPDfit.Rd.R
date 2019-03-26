library(ReIns)


### Name: EPDfit
### Title: Fit EPD using MLE
### Aliases: EPDfit

### ** Examples

data(soa)

# Look at last 500 observations of SOA data
SOAdata <- sort(soa$size)[length(soa$size)-(0:499)]

# Fit EPD to last 500 observations
res <- EPDfit(SOAdata/sort(soa$size)[500], tau=-1)



