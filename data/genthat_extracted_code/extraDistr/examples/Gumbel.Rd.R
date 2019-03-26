library(extraDistr)


### Name: Gumbel
### Title: Gumbel distribution
### Aliases: Gumbel dgumbel pgumbel qgumbel rgumbel
### Keywords: distribution

### ** Examples


x <- rgumbel(1e5, 5, 2)
hist(x, 100, freq = FALSE)
curve(dgumbel(x, 5, 2), 0, 25, col = "red", add = TRUE)
hist(pgumbel(x, 5, 2))
plot(ecdf(x))
curve(pgumbel(x, 5, 2), 0, 25, col = "red", lwd = 2, add = TRUE)




