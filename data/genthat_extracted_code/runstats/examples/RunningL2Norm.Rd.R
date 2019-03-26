library(runstats)


### Name: RunningL2Norm
### Title: Fast Running L2 Norm Computation
### Aliases: RunningL2Norm

### ** Examples

## Ex.1.
x <- sin(seq(0, 1, length.out = 1000) * 2 * pi * 6)
y1 <- x[1:100] + rnorm(100)
y2 <- rnorm(100)
out1 <- RunningL2Norm(x, y1)
out2 <- RunningL2Norm(x, y2)
plot(out1, type = "l"); points(out2, col = "blue")
## Ex.2.
x <- sin(seq(0, 1, length.out = 1000) * 2 * pi * 6)
y <- x[1:100] + rnorm(100)
out1 <- RunningL2Norm(x, y, circular = TRUE)
out2 <- RunningL2Norm(x, y, circular = FALSE)
plot(out1, type = "l"); points(out2, col = "red")



