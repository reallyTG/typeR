library(LPWC)


### Name: corr.bestlag
### Title: Computes best lag correlation
### Aliases: corr.bestlag

### ** Examples

corr.bestlag(array(rnorm(30), c(5, 6)), max.lag = 1,
          timepoints = c(0, 5, 10, 15, 20, 25), C = 10, penalty = "high")
corr.bestlag(array(runif(40, 0, 20), c(4, 10)),
          timepoints = c(0, 0.5, 1.5, 3, 6, 12, 18, 26, 39, 50), penalty = "high")
corr.bestlag(matrix(data = rexp(n = 40, 2), nrow = 8),
          timepoints = c(0, 5, 15, 20, 40), penalty = "low", iter = 5)




