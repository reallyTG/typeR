library(vars)


### Name: serial.test
### Title: Test for serially correlated errors
### Aliases: serial.test serial-deprecated
### Keywords: regression

### ** Examples

data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
serial.test(var.2c, lags.pt = 16, type = "PT.adjusted")



