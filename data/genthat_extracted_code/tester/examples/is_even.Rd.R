library(tester)


### Name: is_even
### Title: Is even
### Aliases: is_even is_not_even

### ** Examples

is_even(2)
is_even(1)
is_even(seq(-5, 5))

is_even(iris$Species)
is_even(iris)
is_even(list(1, 0, -1, iris))

set.seed(999)
M = matrix(1:12, 4, 3)
is_even(M)



