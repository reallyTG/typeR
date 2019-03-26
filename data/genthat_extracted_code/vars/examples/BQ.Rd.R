library(vars)


### Name: BQ
### Title: Estimates a Blanchard-Quah type SVAR
### Aliases: BQ
### Keywords: regression

### ** Examples

data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
BQ(var.2c)



