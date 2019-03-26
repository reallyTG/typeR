library(robustHD)


### Name: getScale
### Title: Extract the residual scale of a robust regression model
### Aliases: getScale getScale.seqModel getScale.sparseLTS
### Keywords: regression

### ** Examples

data("coleman")
fit <- lmrob(Y ~ ., data=coleman)
getScale(fit)



