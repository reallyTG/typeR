library(MuMIn)


### Name: cos2Weights
### Title: Cos-squared model weights
### Aliases: cos2Weights
### Keywords: models

### ** Examples

## Don't show: 
if(length(find.package("expm", quiet = TRUE)) == 1) {
## End(Don't show)
fm <- lm(y ~ X1 + X2 + X3 + X4, Cement, na.action = na.fail)
# most efficient way to produce a list of all-subsets models
models <- lapply(dredge(fm, evaluate = FALSE), eval)
ma <- model.avg(models)

test.data <- Cement
Weights(ma) <- cos2Weights(models, data = test.data)
predict(ma, data = test.data)
## Don't show: 
} else message("Need CRAN package 'expm' to run this example")
## End(Don't show)



