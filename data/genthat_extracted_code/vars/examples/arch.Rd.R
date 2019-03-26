library(vars)


### Name: arch.test
### Title: ARCH-LM test
### Aliases: arch.test arch-deprecated print.varcheck
### Keywords: regression

### ** Examples

data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
arch.test(var.2c)



