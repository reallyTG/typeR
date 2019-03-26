library(scorecardModelUtils)


### Name: random_forest_parameters
### Title: Hyperparameter optimisation or parameter tuning for Random
###   Forest by grid search
### Aliases: random_forest_parameters

### ** Examples

data <- iris
set.seed(11)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
rf_params_list <- random_forest_parameters(base = data,target = "Y",
                  model_type = "classification",ntree = 2,mtry = 1,nodesize = 3)
rf_params_list$error_tab_detailed
rf_params_list$error_tab_summary
rf_params_list$best_ntree
rf_params_list$best_mtry
rf_params_list$maxnodes
rf_params_list$best_nodesize
rf_params_list$runtime



