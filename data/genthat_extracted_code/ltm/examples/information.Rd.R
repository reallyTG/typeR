library(ltm)


### Name: information
### Title: Area under the Test or Item Information Curves
### Aliases: information
### Keywords: multivariate

### ** Examples


fit <- rasch(LSAT)
information(fit, c(-2, 0))
information(fit, c(0, 2), items = c(3, 5))




