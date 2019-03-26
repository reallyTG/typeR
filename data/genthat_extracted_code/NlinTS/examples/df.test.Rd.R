library(NlinTS)


### Name: df.test
### Title: Augmented Dickey_Fuller test
### Aliases: df.test

### ** Examples

library (timeSeries)
library (NlinTS)
#load data
data = LPP2005REC
model = df.test (data[,1], 1)
model$summary ()



