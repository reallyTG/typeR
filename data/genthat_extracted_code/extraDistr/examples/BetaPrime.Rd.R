library(extraDistr)


### Name: BetaPrime
### Title: Beta prime distribution
### Aliases: BetaPrime dbetapr pbetapr qbetapr rbetapr
### Keywords: distribution

### ** Examples


x <- rbetapr(1e5, 5, 3, 2)
hist(x, 350, freq = FALSE, xlim = c(0, 100))
curve(dbetapr(x, 5, 3, 2), 0, 100, col = "red", add = TRUE, n = 500)
hist(pbetapr(x, 5, 3, 2))
plot(ecdf(x), xlim = c(0, 100))
curve(pbetapr(x, 5, 3, 2), 0, 100, col = "red", add = TRUE, n = 500)




