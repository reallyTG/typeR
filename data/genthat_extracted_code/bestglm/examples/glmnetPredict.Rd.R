library(bestglm)


### Name: glmnetPredict
### Title: Glmnet Prediction Using CVAV.
### Aliases: glmnetPredict
### Keywords: models regression

### ** Examples

set.seed(7733551)
out <- trainTestPartition(mcdonald)
round(glmnetGridTable(out),4)
yh <- glmnetPredict(out, NREP=5)
sqrt(mean((out$yTe - yh)^2))



