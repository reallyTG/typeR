library(MlBayesOpt)


### Name: svm_cv_opt
### Title: Bayesian Optimization for SVM
### Aliases: svm_cv_opt

### ** Examples

library(MlBayesOpt)

set.seed(71)
res0 <- svm_cv_opt(data = iris,
                   label = Species,
                   n_folds = 3,
                   init_points = 10,
                   n_iter = 1)




