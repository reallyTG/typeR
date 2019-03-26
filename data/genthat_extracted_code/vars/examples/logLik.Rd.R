library(vars)


### Name: logLik
### Title: Log-Likelihood method
### Aliases: logLik logLik.varest logLik.vec2var logLik.svarest
###   logLik.svecest
### Keywords: regression

### ** Examples

data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
logLik(var.2c) 



