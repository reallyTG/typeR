library(MXM)


### Name: Cross-Validation for gOMP
### Title: Cross-Validation for gOMP
### Aliases: cv.gomp

### ** Examples

set.seed(1234)

# simulate a dataset with continuous data
dataset <- matrix( rnorm(200 * 50), ncol = 50 )
# the target feature is the last column of the dataset as a vector
target <- dataset[, 50]
dataset <- dataset[, -50]

# run a 10 fold CV for the regression task
best_model = cv.gomp(target, dataset, kfolds = 5, task = "R", 
tol = seq(0.001, 0.01,by=0.001), method = "ar2" )

# get the results




