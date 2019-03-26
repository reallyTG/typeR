library(LaplacesDemon)


### Name: dist.ContinuousRelaxation
### Title: Continuous Relaxation of a Markov Random Field Distribution
### Aliases: dcrmrf rcrmrf
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dcrmrf(rnorm(5), rnorm(5), diag(5))
x <- rcrmrf(10, rnorm(5), diag(5))



