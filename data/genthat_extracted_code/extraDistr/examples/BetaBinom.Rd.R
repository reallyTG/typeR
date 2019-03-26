library(extraDistr)


### Name: BetaBinom
### Title: Beta-binomial distribution
### Aliases: BetaBinom dbbinom pbbinom rbbinom
### Keywords: distribution

### ** Examples


x <- rbbinom(1e5, 1000, 5, 13)
xx <- 0:1000
hist(x, 100, freq = FALSE)
lines(xx-0.5, dbbinom(xx, 1000, 5, 13), col = "red")
hist(pbbinom(x, 1000, 5, 13))
xx <- seq(0, 1000, by = 0.1)
plot(ecdf(x))
lines(xx, pbbinom(xx, 1000, 5, 13), col = "red", lwd = 2)




