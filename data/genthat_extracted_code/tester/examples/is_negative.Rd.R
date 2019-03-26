library(tester)


### Name: is_negative
### Title: Is negative
### Aliases: is_negative is_not_negative

### ** Examples

is_negative(1)
is_negative(0)
is_negative(-1)
is_negative(iris$Species)
is_negative(iris)
is_negative(list(1, 0, -1, iris))

set.seed(999)
M = matrix(rnorm(12), 4, 3)
is_negative(M)



