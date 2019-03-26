library(extraDistr)


### Name: HalfCauchy
### Title: Half-Cauchy distribution
### Aliases: HalfCauchy dhcauchy phcauchy qhcauchy rhcauchy
### Keywords: distribution

### ** Examples


x <- rhcauchy(1e5, 2)
hist(x, 2e5, freq = FALSE, xlim = c(0, 100))
curve(dhcauchy(x, 2), 0, 100, col = "red", add = TRUE)
hist(phcauchy(x, 2))
plot(ecdf(x), xlim = c(0, 100))
curve(phcauchy(x, 2), col = "red", lwd = 2, add = TRUE)




