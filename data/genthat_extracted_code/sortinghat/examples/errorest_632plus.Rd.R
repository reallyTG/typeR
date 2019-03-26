library(sortinghat)


### Name: errorest_632plus
### Title: Calculates the .632+ Error Rate for a specified classifier given
###   a data set.
### Aliases: errorest_632plus

### ** Examples

require('MASS')
iris_x <- data.matrix(iris[, -5])
iris_y <- iris[, 5]

# Because the \code{classify} function returns multiples objects in a list,
# we provide a wrapper function that returns only the class labels.
lda_wrapper <- function(object, newdata) { predict(object, newdata)$class }
set.seed(42)

# We compute the apparent and LOO-Boot error rates up front to demonstrate
# that they can be computed before the \code{errorest_632plus} function is called.

set.seed(42)
apparent <- errorest_apparent(x = iris_x, y = iris_y, train = MASS:::lda,
                              classify = lda_wrapper)
set.seed(42)
loo_boot <- errorest_loo_boot(x = iris_x, y = iris_y, train = MASS:::lda,
                              classify = lda_wrapper)

# Each of the following 3 calls should result in the same error rate.
# 1. The apparent error rate is provided, while the LOO-Boot must be computed.
set.seed(42)
errorest_632plus(x = iris_x, y = iris_y, train = MASS:::lda,
                 classify = lda_wrapper, apparent = apparent)
# 2. The LOO-Boot error rate is provided, while the apparent must be computed.
set.seed(42)
errorest_632plus(x = iris_x, y = iris_y, train = MASS:::lda,
                 classify = lda_wrapper, loo_boot = loo_boot)
# 3. Both error rates are provided, so the calculation is quick.
errorest_632plus(x = iris_x, y = iris_y, train = MASS:::lda,
                 classify = lda_wrapper, apparent = apparent,
                 loo_boot = loo_boot)

# In each case the output is: 0.02194472



