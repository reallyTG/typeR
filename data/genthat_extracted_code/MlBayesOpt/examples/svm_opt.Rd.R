library(MlBayesOpt)


### Name: svm_opt
### Title: Bayesian Optimization for SVM
### Aliases: svm_opt

### ** Examples

library(MlBayesOpt)

set.seed(71)
res0 <- svm_opt(train_data = iris_train,
                train_label = Species,
                test_data = iris_test,
                test_label = Species,
                svm_kernel = "polynomial",
                init_points = 10,
                n_iter = 1)




