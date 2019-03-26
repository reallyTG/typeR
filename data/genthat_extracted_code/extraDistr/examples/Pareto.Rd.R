library(extraDistr)


### Name: Pareto
### Title: Pareto distribution
### Aliases: Pareto dpareto ppareto qpareto rpareto
### Keywords: distribution

### ** Examples


x <- rpareto(1e5, 5, 16)
hist(x, 100, freq = FALSE)
curve(dpareto(x, 5, 16), 0, 200, col = "red", add = TRUE)
hist(ppareto(x, 5, 16))
plot(ecdf(x))
curve(ppareto(x, 5, 16), 0, 200, col = "red", lwd = 2, add = TRUE)




