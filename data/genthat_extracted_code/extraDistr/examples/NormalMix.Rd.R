library(extraDistr)


### Name: NormalMix
### Title: Mixture of normal distributions
### Aliases: NormalMix dmixnorm pmixnorm rmixnorm
### Keywords: distribution

### ** Examples


x <- rmixnorm(1e5, c(0.5, 3, 6), c(3, 1, 1), c(1/3, 1/3, 1/3))
hist(x, 100, freq = FALSE)
curve(dmixnorm(x, c(0.5, 3, 6), c(3, 1, 1), c(1/3, 1/3, 1/3)),
      -20, 20, n = 500, col = "red", add = TRUE)
hist(pmixnorm(x, c(0.5, 3, 6), c(3, 1, 1), c(1/3, 1/3, 1/3)))
plot(ecdf(x))
curve(pmixnorm(x, c(0.5, 3, 6), c(3, 1, 1), c(1/3, 1/3, 1/3)),
      -20, 20, n = 500, col = "red", lwd = 2, add = TRUE)




