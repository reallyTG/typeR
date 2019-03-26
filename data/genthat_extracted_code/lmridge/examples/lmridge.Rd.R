library(lmridge)


### Name: lmridge
### Title: Linear Ridge Regression
### Aliases: lmridge lmridge.default coef.lmridge print.lmridge
###   fitted.lmridge lmridgeEst
### Keywords: ridge regression

### ** Examples

data(Hald)
mod <- lmridge(y~., data = as.data.frame(Hald), K = seq(0, 0.1, 0.01), scaling = "sc")
## Scaled Coefficients
mod$coef

## Re-Scaled Coefficients
coef(mod)

## ridge predicted values
predict(mod)

## ridge residuals
residuals(mod)

##ridge and VIF trace
plot(mod)

## ridge VIF values
vif(mod)

## ridge Var-Cov matrix
vcov(mod)

## ridge biasing parameter by researchers
kest(mod)

## ridge fitted values
fitted(mod)

## ridge statistics 1
rstats1(mod)

## ridge statistics 2
rstats2(mod)

## list of objects from lmridgeEst function
lmridgeEst(y~., data = as.data.frame(Hald), K = seq(0, 0.1, 0.01), scaling = "sc")



