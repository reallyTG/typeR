library(tester)


### Name: is_decimal
### Title: Is decimal
### Aliases: is_decimal is_not_decimal

### ** Examples

is_decimal(0.01) # TRUE
is_decimal(-0.01) # TRUE
is_decimal(0) # FALSE
is_decimal(1) # FALSE
is_decimal(runif(5))
is_decimal(rnorm(5))

M = matrix(seq(-2, 2, length.out=10), 5, 2)
is_decimal(M)



