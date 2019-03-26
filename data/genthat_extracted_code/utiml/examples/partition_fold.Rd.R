library(utiml)


### Name: partition_fold
### Title: Create the multi-label dataset from folds
### Aliases: partition_fold

### ** Examples

folds <- create_kfold_partition(toyml, 10)

# Using the first partition
dataset <- partition_fold(folds, 1)
names(dataset)
## [1] "train" "test"

# All iterations
for (i in 1:10) {
   dataset <- partition_fold(folds, i)
   #dataset$train
   #dataset$test
}

# Using 3 folds validation
dataset <- partition_fold(folds, 3, TRUE)
# dataset$train, dataset$test, #dataset$validation



