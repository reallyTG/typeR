library(vars)


### Name: Psi
### Title: Coefficient matrices of the orthogonalised MA represention
### Aliases: Psi Psi.varest Psi.vec2var
### Keywords: regression

### ** Examples

data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
Psi(var.2c, nstep=4)



