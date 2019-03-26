library(tester)


### Name: is_odd
### Title: Is even
### Aliases: is_not_odd is_odd

### ** Examples

is_odd(2)
is_odd(1)
is_odd(seq(-5, 5))

is_odd(iris$Species)
is_odd(iris)
is_odd(list(1, 0, -1, iris))

set.seed(999)
M = matrix(1:12, 4, 3)
is_odd(M)



