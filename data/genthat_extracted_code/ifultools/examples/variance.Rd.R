library(ifultools)


### Name: variance
### Title: Variance computation, usable in both S-PLUS and R
### Aliases: variance
### Keywords: utilities

### ** Examples

set.seed(100)
x <- rnorm(100)
variance(x, unbiased=TRUE)
variance(x, unbiased=FALSE)
variance(c(x,rep(NA,30)), na.rm=TRUE)



