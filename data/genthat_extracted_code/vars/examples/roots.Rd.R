library(vars)


### Name: roots
### Title: Eigenvalues of the companion coefficient matrix of a
###   VAR(p)-process
### Aliases: roots
### Keywords: regression

### ** Examples

data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
roots(var.2c)



