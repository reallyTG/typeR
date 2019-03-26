library(extraDistr)


### Name: LocationScaleT
### Title: Location-scale version of the t-distribution
### Aliases: LocationScaleT dlst plst qlst rlst
### Keywords: distribution

### ** Examples


x <- rlst(1e5, 1000, 5, 13)
hist(x, 100, freq = FALSE)
curve(dlst(x, 1000, 5, 13), -60, 60, col = "red", add = TRUE)
hist(plst(x, 1000, 5, 13))
plot(ecdf(x))
curve(plst(x, 1000, 5, 13), -60, 60, col = "red", lwd = 2, add = TRUE)




