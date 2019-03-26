library(lineqGPR)


### Name: errorMeasureRegressMC
### Title: Error Measures for GP Models using Monte Carlo Samples.
### Aliases: errorMeasureRegressMC

### ** Examples

# generating the toy example
n <- 100
w <- 4*pi
x <- seq(0, 1, length = n)
y <- sin(w*x)

# results with high-level noises generating the toy example
nbsamples <- 100
set.seed(1)
ynoise <- y + matrix(rnorm(n*nbsamples, 0, 10), ncol = nbsamples)
matplot(x, ynoise, type = "l", col = "gray70")
lines(x, y, lty = 2, col = "red")
legend("topright", c("target", "samples"), lty = c(2,1), col = c("red", "gray70"))
t(errorMeasureRegressMC(y, y, ynoise))

# results with low-level noises generating the toy example
set.seed(1)
ynoise <- y + matrix(rnorm(n*nbsamples, 0, 0.05), ncol = nbsamples)
matplot(x, ynoise, type = "l", col = "gray70")
lines(x, y, lty = 2, col = "red")
legend("topright", c("target", "samples"), lty = c(2,1), col = c("red", "gray70"))
t(errorMeasureRegressMC(y, y, ynoise))




