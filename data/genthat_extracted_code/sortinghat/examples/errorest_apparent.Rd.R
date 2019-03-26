library(sortinghat)


### Name: errorest_apparent
### Title: Calculates the Apparent Error Rate for a specified classifier
###   given a data set.
### Aliases: errorest_apparent

### ** Examples

require('MASS')
iris_x <- data.matrix(iris[, -5])
iris_y <- iris[, 5]

# Because the \code{classify} function returns multiples objects in a list,
# we provide a wrapper function that returns only the class labels.
lda_wrapper <- function(object, newdata) { predict(object, newdata)$class }
errorest_apparent(x = iris_x, y = iris_y, train = MASS:::lda, classify = lda_wrapper)
# Output: 0.02

# The following code is equivalent for this example:
lda_out <- MASS:::lda(x = iris_x, grouping = iris_y)
lda_classifications <- predict(lda_out, newdata = iris_x)$class
mean(lda_classifications != iris_y)
# Output: 0.02



