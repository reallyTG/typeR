library(NlinTS)


### Name: nlin_causality.test
### Title: A non linear Granger causality test
### Aliases: nlin_causality.test

### ** Examples

library (timeSeries) # to extract time series
library (NlinTS)
data = LPP2005REC
# We construct the model based
model = nlin_causality.test (data[,1], data[,2], 2, c(2, 2), c(4, 4), 500, TRUE)
model$summary ()



