library(lars)


### Name: predict.lars
### Title: Make predictions or extract coefficients from a fitted lars
###   model
### Aliases: predict.lars coef.lars
### Keywords: regression methods

### ** Examples

data(diabetes)
attach(diabetes)
object <- lars(x,y,type="lasso")
### make predictions at the values in x, at each of the
### steps produced in object
fits <- predict.lars(object, x, type="fit")
### extract the coefficient vector with L1 norm=4.1
coef4.1 <- coef(object, s=4.1, mode="norm") # or
coef4.1 <- predict(object, s=4.1, type="coef", mode="norm")
detach(diabetes)



