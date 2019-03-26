library(liureg)


### Name: liu
### Title: Liu Regression and Estimator
### Aliases: liu liu.default coef.liu print.liu fitted.liu liuest
### Keywords: Liu Regression Liu Estimator Bias Regression Methods

### ** Examples

data(Hald)
mod<-liu(y~., data = as.data.frame(Hald), d = seq(0, 0.1, 0.01), scaling = "centered")
## Scaled Coefficients
mod$coef

## Re-Scaled Coefficients
coef(mod)

## Liu fitted values
fitted(mod)

## Liu predited values
predict(mod)

## Liu Residuals
residuals(mod)

## Liu trace
plot(mod)

## Liu Var-Cov matrix
vcov(mod)

## Liu biasing parameters by researchers
dest(mod)

## Liu related statistics
lstats(mod)

## list of objects from liuest function
liuest(y~., data = as.data.frame(Hald), d = seq(0, 0.1, 0.01), scaling = "centered")



