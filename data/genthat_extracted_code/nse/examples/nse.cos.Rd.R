library(nse)


### Name: nse.cos
### Title: Long-run variance estimation using low-frequency cosine series.
### Aliases: nse.cos

### ** Examples

n    = 1000
ar   = 0.9
mean = 1
sd   = 1
set.seed(1234)
x = as.vector(arima.sim(n = n, list(ar = ar), sd = sd) + mean)

nse.cos(x = x, q = 12, lag.prewhite = 0)
#' nse.cos(x = x, q = 12, lag.prewhite = NULL)



