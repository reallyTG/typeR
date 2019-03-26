library(robcor)


### Name: FastQn
### Title: Robust, Efficient and Fast Scale Estimate
### Aliases: FastQn fqn s_FastQn

### ** Examples

set.seed(153)
x <- sort(c(rnorm(80), rt(20, df = 1)))
s_FastQn(x, mu.too=TRUE)
FastQn(x)



