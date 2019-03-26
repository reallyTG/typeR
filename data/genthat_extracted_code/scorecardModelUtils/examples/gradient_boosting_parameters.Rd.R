library(scorecardModelUtils)


### Name: gradient_boosting_parameters
### Title: Hyperparameter optimisation or parameter tuning for Gradient
###   Boosting Regression Modelling by grid search
### Aliases: gradient_boosting_parameters

### ** Examples

data <- iris
set.seed(11)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
gbm_params_list <- gradient_boosting_parameters(base = data,target = "Y",ntree = 2,depth = 2,
                   shrinkage = 0.1,min_obs = 0.1,bag_fraction = 0.7)
gbm_params_list$error_tab_detailed
gbm_params_list$error_tab_summary
gbm_params_list$best_ntree
gbm_params_list$best_depth
gbm_params_list$best_shrinkage
gbm_params_list$best_min_obs
gbm_params_list$best_bag_fraction
gbm_params_list$runtime



