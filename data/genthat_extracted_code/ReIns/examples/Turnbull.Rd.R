library(ReIns)


### Name: Turnbull
### Title: Turnbull estimator
### Aliases: Turnbull

### ** Examples

L <- 1:10
R <- c(1, 2.5, 3, 4, 5.5, 6, 7.5, 8.25, 9, 10.5)
censored <- c(0, 1, 0, 0, 1, 0, 1, 1, 0, 1)

x <- seq(0, 12, 0.1)

# Turnbull estimator
plot(x, Turnbull(x, L, R, censored)$cdf, type="s", ylab="Turnbull estimator")



