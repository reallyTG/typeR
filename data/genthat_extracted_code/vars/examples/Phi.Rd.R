library(vars)


### Name: Phi
### Title: Coefficient matrices of the MA represention
### Aliases: Phi Phi.varest Phi.svarest Phi.svecest Phi.vec2var
### Keywords: regression

### ** Examples

data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
Phi(var.2c, nstep=4)



