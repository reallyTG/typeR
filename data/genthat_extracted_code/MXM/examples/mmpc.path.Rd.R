library(MXM)


### Name: MMPC solution paths for many combinations of hyper-parameters
### Title: MMPC solution paths for many combinations of hyper-parameters
### Aliases: mmpc.path wald.mmpc.path perm.mmpc.path
### Keywords: SES Multiple Feature Signatures Feature Selection Variable
###   Selection

### ** Examples

set.seed(123)
# simulate a dataset with continuous data
dataset <- matrix(runif(1000 * 101, 1, 100), nrow = 1000 ) 
#the target feature is the last column of the dataset as a vector
target <- dataset[, 101]
dataset <- dataset[, -101]

a <- mmpc.path(target, dataset, max_ks = NULL, alphas = NULL, test = NULL, 
user_test = NULL, ncores = 1)



