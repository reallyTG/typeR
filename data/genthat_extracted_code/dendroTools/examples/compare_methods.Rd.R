library(dendroTools)


### Name: compare_methods
### Title: compare_methods
### Aliases: compare_methods

### ** Examples

## Not run: 
##D 
##D # An example with default settings of machine learning algorithms
##D library(dendroTools)
##D data(example_dataset_1)
##D example_1 <- compare_methods(formula = MVA~., dataset = example_dataset_1,
##D edge_share = 0, holdout = "late")
##D example_1$mean_std
##D example_1$holdout_results
##D example_1$edge_results
##D example_1$ranks
##D example_1$bias_cal
##D example_1$bias_val
##D example_1$transfer_functions
##D example_1$transfer_functions_together
##D example_1$PCA_output
##D example_1$parameter_values
##D example_1$residuals_vs_fitted_cal
##D example_1$residuals_vs_fitted_edge
##D example_1$residuals_vs_fitted_holdout
##D example_1$normal_QQ_cal
##D example_1$normal_QQ_edge
##D example_1$normal_QQ_holdout
##D 
##D 
##D example_2 <- compare_methods(formula = MVA ~  T_APR,
##D dataset = example_dataset_1, k = 5, repeats = 10, BRNN_neurons = 1,
##D RF_ntree = 100, RF_mtry = 2, RF_maxnodes = 35, seed_factor = 5)
##D example_2$mean_std
##D example_2$ranks
##D example_2$bias_cal
##D example_2$transfer_functions
##D example_2$transfer_functions_together
##D example_2$PCA_output
##D example_2$parameter_values
##D 
##D example_3 <- compare_methods(formula = MVA ~ .,
##D dataset = example_dataset_1, k = 2, repeats = 5,
##D methods = c("MLR", "BRNN", "MT"),
##D optimize = TRUE, MLR_stepwise = TRUE)
##D example_3$mean_std
##D example_3$ranks
##D example_3$bias_val
##D example_3$transfer_functions
##D example_3$transfer_functions_together
##D example_3$parameter_values
##D 
##D library(dendroTools)
##D library(ggplot2)
##D data(dataset_TRW)
##D comparison_TRW <- compare_methods(formula = T_Jun_Jul ~ TRW, dataset = dataset_TRW,
##D k = 3, repeats = 10, optimize = FALSE, methods = c("MLR", "BRNN", "RF", "MT"),
##D seed_factor = 5, dataset_complete = dataset_TRW_complete, MLR_stepwise = TRUE,
##D stepwise_direction = "backward")
##D comparison_TRW$mean_std
##D comparison_TRW$bias_val
##D comparison_TRW$transfer_functions + xlab(expression(paste('TRW'))) +
##D ylab("June-July Mean Temperature [Â°C]")
##D comparison_TRW$reconstructions
##D comparison_TRW$reconstructions_together
##D comparison_TRW$edge_results
## End(Not run)



