library(tester)


### Name: is_positive
### Title: Is positive
### Aliases: is_not_positive is_positive

### ** Examples

is_positive(1)
is_positive(0)
is_positive(-1)
is_positive(iris$Species)
is_positive(iris)
is_positive(list(1, 0, -1, iris))

set.seed(999)
M = matrix(rnorm(12), 4, 3)
is_positive(M)



