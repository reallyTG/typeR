library(sortinghat)


### Name: partition_data
### Title: Helper function that partitions a data set into training and
###   test data sets.
### Aliases: partition_data

### ** Examples

require('MASS')
x <- iris[, -5]
y <- iris[, 5]
set.seed(42)
data <- partition_data(x = x, y = y)
table(data$train_y)
table(data$test_y)

data <- partition_data(x = x, y = y, preserve_proportions = TRUE)
table(data$train_y)
table(data$test_y)



