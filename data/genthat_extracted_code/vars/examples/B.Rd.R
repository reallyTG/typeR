library(vars)


### Name: Bcoef
### Title: Coefficient matrix of an estimated VAR(p)
### Aliases: Bcoef B-deprecated
### Keywords: regression

### ** Examples

data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
Bcoef(var.2c)



