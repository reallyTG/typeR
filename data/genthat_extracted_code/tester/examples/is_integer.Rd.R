library(tester)


### Name: is_integer
### Title: Is integer
### Aliases: is_integer is_not_integer

### ** Examples

is_integer(1) # TRUE
is_integer(-3) # TRUE
is_integer(pi) # FALSE
is_integer(iris$Species)

M = matrix(seq(-3, 2), 2, 3)
is_integer(M)



