library(lmtest)


### Name: jocci
### Title: U.S. Macroeconomic Time Series
### Aliases: fyff gmdc ip jocci lhur pw561
### Keywords: datasets

### ** Examples

data(jocci)

dwtest(dy ~ 1, data = jocci)
bgtest(dy ~ 1, data = jocci)
ar6.model <- dy ~ dy1 + dy2 + dy3 + dy4 + dy5 +dy6
bgtest(ar6.model, data = jocci)

var.model <- ~ I(dy1^2) + I(dy2^2) + I(dy3^2) + I(dy4^2) + I(dy5^2) + I(dy6^2)
bptest(ar6.model, var.model, data = jocci)



