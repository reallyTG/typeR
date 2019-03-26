library(episcan)


### Name: getcor
### Title: Get correlation matrix
### Aliases: getcor

### ** Examples

set.seed(123)
A <- matrix(rnorm(100, mean = 5, sd = 10), ncol = 10)
B <- matrix(rnorm(200, mean = 10, sd = 100), ncol = 20)
C <- getcor(A, B)



