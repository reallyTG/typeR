library(randomForestSRC)


### Name: holdoutvimp
### Title: Hold out variable importance (VIMP)
### Aliases: holdoutvimp holdoutvimp.rfsrc
### Keywords: vimp

### ** Examples

## No test: 
## ------------------------------------------------------------
## Boston housing example
## ------------------------------------------------------------

if (library("mlbench", logical.return = TRUE)) {

  data(BostonHousing)
  hv <- holdoutvimp(medv ~ ., BostonHousing)
  print(hv)

}

## ------------------------------------------------------------
## Multivariate regression analysis
## ------------------------------------------------------------

hv <- holdoutvimp(cbind(mpg, cyl) ~., mtcars)
print(hv)

## ------------------------------------------------------------
## White wine classification example
## ------------------------------------------------------------

data(wine, package = "randomForestSRC")
wine$quality <- factor(wine$quality)
hv <- holdoutvimp(quality ~ ., wine, vtry = 5)
print(100 * hv)


## ------------------------------------------------------------
## pbc survival example
## ------------------------------------------------------------

data(pbc, package = "randomForestSRC")
hv <- holdoutvimp(Surv(days, status) ~ ., pbc, splitrule = "random")
print(100 * hv)

## ------------------------------------------------------------
## WIHS competing risk example
## ------------------------------------------------------------

data(wihs, package = "randomForestSRC")
hv <- holdoutvimp(Surv(time, status) ~ ., wihs, ntree = 1000)
print(100 * hv)

## End(No test)


