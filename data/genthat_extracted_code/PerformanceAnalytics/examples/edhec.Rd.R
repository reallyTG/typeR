library(PerformanceAnalytics)


### Name: edhec
### Title: EDHEC-Risk Hedge Fund Style Indices
### Aliases: edhec
### Keywords: datasets

### ** Examples

data(edhec)

#preview the data
head(edhec)

#summary period statistics
summary(edhec)

#cumulative index returns
tail(cumprod(1+edhec),1)



