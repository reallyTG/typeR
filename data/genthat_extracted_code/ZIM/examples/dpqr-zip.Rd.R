library(ZIM)


### Name: ZIP
### Title: The Zero-Inflated Poisson Distribution
### Aliases: ZIP dzip pzip qzip rzip
### Keywords: distribution

### ** Examples

dzip(x = 0:10, lambda = 1, omega = 0.5)
pzip(q = c(1, 5, 9), lambda = 1, omega = 0.5)
qzip(p = c(0.25, 0.50, 0.75), lambda = 1, omega = 0.5)
set.seed(123)
rzip(n = 100, lambda = 1, omega = 0.5)



