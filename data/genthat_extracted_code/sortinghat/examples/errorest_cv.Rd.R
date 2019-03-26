library(sortinghat)


### Name: errorest_cv
### Title: Calculates the Cross-Validation Error Rate for a specified
###   classifier given a data set.
### Aliases: errorest_cv

### ** Examples

require('MASS')
iris_x <- data.matrix(iris[, -5])
iris_y <- iris[, 5]

# Because the \code{classify} function returns multiples objects in a list,
# we provide a wrapper function that returns only the class labels.
lda_wrapper <- function(object, newdata) { predict(object, newdata)$class }

set.seed(42)
errorest_cv(x = iris_x, y = iris_y, train = MASS:::lda, classify = lda_wrapper)
# Output: 0.02666667



