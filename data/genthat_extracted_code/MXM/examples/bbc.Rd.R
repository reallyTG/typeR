library(MXM)


### Name: Bootstrap bias correction for the performance of the cross-validation procedure
### Title: Bootstrap bias correction for the performance of the
###   cross-validation procedure
### Aliases: bbc
### Keywords: Cross validation SES MMPC parallel

### ** Examples

predictions <- matrix(rbinom(100 * 200, 1, 0.7), ncol = 200) 
target <- rbinom(200, 1, 0.5)
bbc(predictions, target, metric = "auc.mxm")



