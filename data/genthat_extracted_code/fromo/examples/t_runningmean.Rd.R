library(fromo)


### Name: t_running_sum
### Title: Compute sums or means over a sliding time window.
### Aliases: t_running_sum t_running_mean

### ** Examples

x <- rnorm(1e5)
xs <- t_running_sum(x,time=seq_along(x),window=10)
xm <- t_running_mean(x,time=cumsum(runif(length(x))),window=7.3)




