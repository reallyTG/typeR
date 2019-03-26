library(pls)


### Name: msc
### Title: Multiplicative Scatter Correction
### Aliases: msc predict.msc makepredictcall.msc
### Keywords: regression multivariate

### ** Examples

data(yarn)
## Direct correction:
Ztrain <- msc(yarn$NIR[yarn$train,])
Ztest <- predict(Ztrain, yarn$NIR[!yarn$train,])

## Used in formula:
mod <- plsr(density ~ msc(NIR), ncomp = 6, data = yarn[yarn$train,])
pred <- predict(mod, newdata = yarn[!yarn$train,]) # Automatically scatter corrected



