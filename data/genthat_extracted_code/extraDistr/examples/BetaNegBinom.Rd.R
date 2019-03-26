library(extraDistr)


### Name: BetaNegBinom
### Title: Beta-negative binomial distribution
### Aliases: BetaNegBinom dbnbinom pbnbinom rbnbinom
### Keywords: distribution

### ** Examples


x <- rbnbinom(1e5, 1000, 5, 13)
xx <- 0:1e5
hist(x, 100, freq = FALSE)
lines(xx-0.5, dbnbinom(xx, 1000, 5, 13), col = "red")
hist(pbnbinom(x, 1000, 5, 13))
xx <- seq(0, 1e5, by = 0.1)
plot(ecdf(x))
lines(xx, pbnbinom(xx, 1000, 5, 13), col = "red", lwd = 2)




