library(tseries)


### Name: runs.test
### Title: Runs Test
### Aliases: runs.test
### Keywords: ts

### ** Examples

x <- factor(sign(rnorm(100)))  # randomness
runs.test(x)

x <- factor(rep(c(-1,1),50))  # over-mixing
runs.test(x)



