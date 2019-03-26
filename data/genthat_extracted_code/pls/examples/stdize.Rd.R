library(pls)


### Name: stdize
### Title: Standardization of Data Matrices
### Aliases: stdize predict.stdized makepredictcall.stdized
### Keywords: regression multivariate

### ** Examples

data(yarn)
## Direct standardization:
Ztrain <- stdize(yarn$NIR[yarn$train,])
Ztest <- predict(Ztrain, yarn$NIR[!yarn$train,])

## Used in formula:
mod <- plsr(density ~ stdize(NIR), ncomp = 6, data = yarn[yarn$train,])
pred <- predict(mod, newdata = yarn[!yarn$train,]) # Automatically standardized



