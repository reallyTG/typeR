library(sortinghat)


### Name: errorest
### Title: Wrapper function to estimate the error rate of a classifier
### Aliases: errorest

### ** Examples

require('MASS')
iris_x <- data.matrix(iris[, -5])
iris_y <- iris[, 5]

# Because the \code{classify} function returns multiples objects in a list,
# we provide a wrapper function that returns only the class labels.
lda_wrapper <- function(object, newdata) { predict(object, newdata)$class }

# Cross-Validation (default)
errorest(x = iris_x, y = iris_y, train = MASS:::lda, classify = lda_wrapper)

# .632
errorest(x = iris_x, y = iris_y, estimator = "632", train = MASS:::lda,
         classify = lda_wrapper)

# Bootstrap Error Rate
# The argument 'num_bootstraps' is passed on to 'errorest_boot'
errorest(x = iris_x, y = iris_y, estimator = "boot", train = MASS:::lda,
         classify = lda_wrapper, num_bootstraps = 42)



