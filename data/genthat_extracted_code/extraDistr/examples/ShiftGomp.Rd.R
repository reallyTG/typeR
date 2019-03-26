library(extraDistr)


### Name: ShiftGomp
### Title: Shifted Gompertz distribution
### Aliases: ShiftGomp dsgomp psgomp rsgomp
### Keywords: distribution

### ** Examples


x <- rsgomp(1e5, 0.4, 1)
hist(x, 50, freq = FALSE)
curve(dsgomp(x, 0.4, 1), 0, 30, col = "red", add = TRUE)
hist(psgomp(x, 0.4, 1))
plot(ecdf(x))
curve(psgomp(x, 0.4, 1), 0, 30, col = "red", lwd = 2, add = TRUE)




