library(runstats)


### Name: RunningCov
### Title: Fast Running Covariance Computation
### Aliases: RunningCov

### ** Examples

x <- sin(seq(0, 1, length.out = 1000) * 2 * pi * 6)
y <- x[1:100]
out1 <- RunningCov(x, y, circular = TRUE)
out2 <- RunningCov(x, y, circular = FALSE)
plot(out1, type = "l"); points(out2, col = "red")




