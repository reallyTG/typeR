library(randomForestSRC)


### Name: rfsrcFast
### Title: Fast Random Forests
### Aliases: rfsrcFast rfsrcFast.rfsrc
### Keywords: forest fast

### ** Examples

## No test: 
## ------------------------------------------------------------
## Iowa housing regression example
## ------------------------------------------------------------

## load the Iowa housing data
data(housing, package = "randomForestSRC")

## do quick and *dirty* imputation
housing2 <- impute(SalePrice ~ ., housing,
         ntree = 50, nimpute = 1, splitrule = "random")

## grow a fast forest
o1 <- rfsrcFast(SalePrice ~ ., housing2)
o2 <- rfsrcFast(SalePrice ~ ., housing2, nodesize = 1)
print(o1)
print(o2)

## grow a fast bivariate forest
o3 <- rfsrcFast(cbind(SalePrice,Overall.Qual) ~ ., housing2)
print(o3)

## ------------------------------------------------------------
## White wine classification example
## ------------------------------------------------------------

data(wine, package = "randomForestSRC")
wine$quality <- factor(wine$quality)
o <- rfsrcFast(quality ~ ., wine)
print(o)


## ------------------------------------------------------------
## pbc survival example
## ------------------------------------------------------------

data(pbc, package = "randomForestSRC")
o <- rfsrcFast(Surv(days, status) ~ ., pbc)
print(o)

## ------------------------------------------------------------
## WIHS competing risk example
## ------------------------------------------------------------

data(wihs, package = "randomForestSRC")
o <- rfsrcFast(Surv(time, status) ~ ., wihs)
print(o)

## End(No test)


