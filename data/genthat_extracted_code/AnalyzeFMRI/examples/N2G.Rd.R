library(AnalyzeFMRI)


### Name: N2G
### Title: Fits the N2G model
### Aliases: N2G
### Keywords: utilities

### ** Examples

par <- c(3, 2, 3, 2, .3, .4)
data <- c(rnorm(10000), rgamma(2000, 10, 1), -rgamma(1400, 10, 1))
hist(data, n = 100, freq = FALSE)

q <- N2G.Fit(data, par, maxit = 10000, method = "BFGS")
p <- seq(-50, 50, .1)
lines(p, N2G.Density(p, q), col = 2)



