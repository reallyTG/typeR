library(lineqGPR)


### Name: errorMeasureRegress
### Title: Error Measures for GP Models.
### Aliases: errorMeasureRegress

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
mu <- apply(ynoise, 1, mean)
sigma <- apply(ynoise, 1, sd)
matplot(x, ynoise, type = "l", col = "gray70")
lines(x, y, lty = 2, col = "red")
lines(x, mu, col = "blue")
lines(x, mu+1.98*sigma, lty = 2)
lines(x, mu-1.98*sigma, lty = 2)
legend("topright", c("target", "mean", "confidence", "samples"),
       lty = c(2,1,2,1), col = c("red", "blue", "black", "gray70"))
t(errorMeasureRegress(y, y, mu, sigma^2))

# results with low-level noises generating the toy example
set.seed(1)
ynoise <- y + matrix(rnorm(n*nbsamples, 0, 0.05), ncol = nbsamples)
mu <- apply(ynoise, 1, mean)
sigma <- apply(ynoise, 1, sd)
matplot(x, ynoise, type = "l", col = "gray70")
lines(x, y, lty = 2, col = "red")
lines(x, mu, col = "blue")
lines(x, mu+1.98*sigma, lty = 2)
lines(x, mu-1.98*sigma, lty = 2)
legend("topright", c("target", "mean", "confidence", "samples"),
       lty = c(2,1,2,1), col = c("red", "blue", "black", "gray70"))
t(errorMeasureRegress(y, y, mu, sigma^2))




