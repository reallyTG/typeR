library(extraDistr)


### Name: Frechet
### Title: Frechet distribution
### Aliases: Frechet dfrechet pfrechet qfrechet rfrechet
### Keywords: distribution

### ** Examples


x <- rfrechet(1e5, 5, 2, 1.5)
xx <- seq(0, 1000, by = 0.1)
hist(x, 200, freq = FALSE)
lines(xx, dfrechet(xx, 5, 2, 1.5), col = "red") 
hist(pfrechet(x, 5, 2, 1.5))
plot(ecdf(x))
lines(xx, pfrechet(xx, 5, 2, 1.5), col = "red", lwd = 2)




