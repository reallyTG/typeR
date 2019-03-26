library(vars)


### Name: predict
### Title: Predict method for objects of class varest and vec2var
### Aliases: predict predict.varest predict.vec2var print.varprd
### Keywords: regression

### ** Examples

data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
predict(var.2c, n.ahead = 8, ci = 0.95) 



