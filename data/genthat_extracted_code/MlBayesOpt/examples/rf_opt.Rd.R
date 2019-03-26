library(MlBayesOpt)


### Name: rf_opt
### Title: Bayesian Optimization for Random Forest
### Aliases: rf_opt

### ** Examples

library(MlBayesOpt)

set.seed(71)
res0 <- rf_opt(train_data = iris_train,
               train_label = Species,
               test_data = iris_test,
               test_label = Species,
               mtry_range = c(1L, ncol(iris_train) - 1),
               num_tree = 10L,
               init_points = 10,
               n_iter = 1)




