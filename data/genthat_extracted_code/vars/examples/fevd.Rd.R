library(vars)


### Name: fevd
### Title: Forecast Error Variance Decomposition
### Aliases: fevd fevd.varest fevd.svarest fevd.svecest fevd.vec2var
###   print.varfevd
### Keywords: regression

### ** Examples

data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
fevd(var.2c, n.ahead = 5)



