library(scaleboot)


### Name: coef
### Title: Extract Model Coefficients
### Aliases: coef.scaleboot coef.scalebootv
### Keywords: models

### ** Examples

data(mam15)
a <- mam15.relltest[["t4"]] # an object of class "scaleboot"
coef(a) # print the estimated beta values
coef(a,sd=TRUE) # with sd



