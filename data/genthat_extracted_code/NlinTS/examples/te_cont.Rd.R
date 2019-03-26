library(NlinTS)


### Name: te_cont
### Title: Continuous Transfer Entropy
### Aliases: te_cont

### ** Examples

library (timeSeries)
library (NlinTS)
#load data
data = LPP2005REC
te = te_cont (data[,1], data[,2], 1, 1, 3)
print (te)



