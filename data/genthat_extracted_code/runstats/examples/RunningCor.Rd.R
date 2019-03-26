library(runstats)


### Name: RunningCor
### Title: Fast Running Correlation Computation
### Aliases: RunningCor

### ** Examples

x <- sin(seq(0, 1, length.out = 1000) * 2 * pi * 6)
y <- x[1:100]
out1 <- RunningCor(x, y, circular = TRUE)
out2 <- RunningCor(x, y, circular = FALSE)
plot(out1, type = "l"); points(out2, col = "red")




