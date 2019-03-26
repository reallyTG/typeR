library(MXM)


### Name: Cross-Validation for SES and MMPC
### Title: Cross-Validation for SES and MMPC
### Aliases: cv.ses cv.mmpc cv.waldses cv.waldmmpc cv.permses cv.permmmpc
###   auc.mxm acc.mxm ord_mae.mxm mae.mxm mse.mxm pve.mxm ci.mxm ciwr.mxm
###   fscore.mxm euclid_sens.spec.mxm glm.mxm lm.mxm rq.mxm
###   acc_multinom.mxm lmrob.mxm weibreg.mxm coxph.mxm poisdev.mxm
###   nbdev.mxm pois.mxm nb.mxm multinom.mxm ordinal.mxm beta.mxm
###   clogit.mxm mci.mxm
### Keywords: Cross validation SES MMPC parallel

### ** Examples

set.seed(1234)

# simulate a dataset with continuous data
dataset <- matrix( rnorm(200 * 50), ncol = 50 )
# the target feature is the last column of the dataset as a vector
target <- dataset[, 50]
dataset <- dataset[, -50]

# get 50 percent of the dataset as a train set
train_set <- dataset[1:100, ]
train_target <- target[1:100]

# run a 10 fold CV for the regression task
best_model = cv.ses(target = train_target, dataset = train_set, kfolds = 5, task = "R")

# get the results
best_model$best_configuration
best_model$best_performance

# summary elements of the process. Press tab after each $ to view all the elements and
# choose the one you are intresting in.
# best_model$cv_results_all[[...]]$...
#i.e.
# mse value for the 1st configuration of SES of the 5 fold
abs(best_model$cv_results_all[[1]]$performances[5])

best_a <- best_model$best_configuration$a
best_max_k <- best_model$best_configuration$max_k



