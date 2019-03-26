library(vars)


### Name: stability
### Title: Structural stability of a VAR(p)
### Aliases: stability stability.default stability.varest print.varstabil
### Keywords: regression

### ** Examples

data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
var.2c.stabil <- stability(var.2c, type = "OLS-CUSUM")
var.2c.stabil
## Not run: 
##D plot(var.2c.stabil)
## End(Not run)



