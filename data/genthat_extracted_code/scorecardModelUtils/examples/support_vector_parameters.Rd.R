library(scorecardModelUtils)


### Name: support_vector_parameters
### Title: Hyperparameter optimisation or parameter tuning for Suppert
###   Vector Machine by grid search
### Aliases: support_vector_parameters

### ** Examples

data <- iris
set.seed(11)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
svm_params_list <- support_vector_parameters(base = data,target = "Y",gamma = 0.1,
                   cost = 0.1,kernel = "radial")
svm_params_list$error_tab_detailed
svm_params_list$error_tab_summary
svm_params_list$best_kernel
svm_params_list$best_degree
svm_params_list$best_gamma
svm_params_list$best_cost
svm_params_list$runtime



