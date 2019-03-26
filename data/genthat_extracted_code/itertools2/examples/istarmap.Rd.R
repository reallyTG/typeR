library(itertools2)


### Name: istarmap
### Title: Iterator that applies a given function to the elements of an
###   iterable.
### Aliases: istar istarmap

### ** Examples

pow <- function(x, y) {
  x^y
}
it <- istarmap(pow, list(c(2, 3, 10), c(5, 2, 3)))
unlist(as.list(it)) == c(32, 9, 1000)

# Similar to the above, but because the second vector is exhausted after two
# calls to `nextElem`, the iterator is exhausted.
it2 <- istarmap(pow, list(c(2, 3, 10), c(5, 2)))
unlist(as.list(it2)) == c(32, 9)

# Another similar example but with lists instead of vectors
it3 <- istarmap(pow, list(list(2, 3, 10), list(5, 2, 3)))
as.list(it3)

# Computes sum of each row in the iris data set
# Numerically equivalent to base::rowSums()
tolerance <- sqrt(.Machine$double.eps)
iris_x <- iris[, -5]
it4 <- istarmap(sum, iris_x)
unlist(as.list(it4)) - rowSums(iris_x) < tolerance



