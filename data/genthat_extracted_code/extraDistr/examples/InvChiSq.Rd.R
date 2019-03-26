library(extraDistr)


### Name: InvChiSq
### Title: Inverse chi-squared and scaled chi-squared distributions
### Aliases: InvChiSq dinvchisq pinvchisq qinvchisq rinvchisq
### Keywords: distribution

### ** Examples


x <- rinvchisq(1e5, 20)
hist(x, 100, freq = FALSE)
curve(dinvchisq(x, 20), 0, 1, n = 501, col = "red", add = TRUE)
hist(pinvchisq(x, 20))
plot(ecdf(x))
curve(pinvchisq(x, 20), 0, 1, n = 501, col = "red", lwd = 2, add = TRUE)

# scaled

x <- rinvchisq(1e5, 10, 5)
hist(x, 100, freq = FALSE)
curve(dinvchisq(x, 10, 5), 0, 150, n = 501, col = "red", add = TRUE)
hist(pinvchisq(x, 10, 5))
plot(ecdf(x))
curve(pinvchisq(x, 10, 5), 0, 150, n = 501, col = "red", lwd = 2, add = TRUE)




