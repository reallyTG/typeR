library(NlinTS)


### Name: causality.test
### Title: The Granger causality test
### Aliases: causality.test

### ** Examples

library (timeSeries) # to extract time series
library (NlinTS)
data = LPP2005REC
model = causality.test (data[,1], data[,2], 2)
model$summary ()



