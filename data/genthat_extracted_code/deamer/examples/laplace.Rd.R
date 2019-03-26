library(deamer)


### Name: laplace
### Title: Laplace distribution
### Aliases: rlaplace dlaplace

### ** Examples

set.seed(1234)

n=1000
x <- rchisq(n,3)
b=0.4
e <- rlaplace(n, 0, b)
y <- x + e  #noisy observations with laplace noise




