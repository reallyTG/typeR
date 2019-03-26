library(spaero)


### Name: get_stats
### Title: Get estimates of time-dependent properties of models.
### Aliases: get_stats

### ** Examples


# A highly autocorrelated time series
x <- 1:10
get_stats(x, stat_bandwidth = 3)$stats

# Plot log of acf
plot(log(get_stats(x, stat_bandwidth = 3)$stats$autocor))

# Check estimates with AR1 simulations with lag-1 core 0.1
w <- rnorm(1000)
xnext <- function(xlast, w) 0.1 * xlast + w
x <- Reduce(xnext, x = w, init = 0, accumulate = TRUE)
acf(x, lag.max = 1, plot = FALSE)
head(get_stats(x, stat_bandwidth = length(x))$stats$autocor)

# Check detrending ability
x2 <- x + seq(1, 10, len = length(x))
ans <- get_stats(x2, center_trend = "local_linear",
                  center_bandwidth = length(x),
                   stat_bandwidth = length(x))$stats
head(ans$autocor)

# The simple acf estimate is inflated by the trend
acf(x2, lag.max = 1, plot = FALSE)

# Check ability to estimate time-dependent autocorrelation
xnext <- function(xlast, w) 0.8 * xlast + w
xhi <- Reduce(xnext, x = w, init = 0, accumulate = TRUE)
acf(xhi, lag.max = 1, plot = FALSE)
wt <- seq(0, 1, len = length(x))
xdynamic <- wt * xhi + (1 - wt) * x
get_stats(xdynamic, stat_bandwidth = 100)$stats$autocor



