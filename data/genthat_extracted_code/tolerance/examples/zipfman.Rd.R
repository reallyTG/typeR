library(tolerance)


### Name: ZipfMandelbrot
### Title: Zipf-Mandelbrot Distributions
### Aliases: ZipfMandelbrot dzipfman pzipfman qzipfman rzipfman
### Keywords: file

### ** Examples

## Randomly generated data from the Zipf distribution.

set.seed(100)
x <- rzipfman(n = 150, s = 2, N = 100)
hist(x, main = "Randomly Generated Data", prob = TRUE)

x.1 <- sort(x)
y <- dzipfman(x = x.1, s = 2, N = 100)
lines(x.1, y, col = 2, lwd = 2)

plot(x.1, pzipfman(q = x.1, s = 2, N = 100), type = "l", 
     xlab = "x", ylab = "Cumulative Probabilities")

qzipfman(p = 0.20, s = 2, N = 100, lower.tail = FALSE)
qzipfman(p = 0.80, s = 2, N = 100)

## Randomly generated data from the Zipf-Mandelbrot distribution.

set.seed(100)
x <- rzipfman(n = 150, s = 2, b = 3, N = 100)
hist(x, main = "Randomly Generated Data", prob = TRUE)

x.1 <- sort(x)
y <- dzipfman(x = x.1, s = 2, b = 3, N = 100)
lines(x.1, y, col = 2, lwd = 2)

plot(x.1, pzipfman(q = x.1, s = 2, b = 3, N = 100), type = "l", 
     xlab = "x", ylab = "Cumulative Probabilities")

qzipfman(p = 0.20, s = 2, b = 3, N = 100, lower.tail = FALSE)
qzipfman(p = 0.80, s = 2, b = 3, N = 100)

## Randomly generated data from the zeta distribution.

set.seed(100)
x <- rzipfman(n = 100, s = 1.3, N = Inf)
hist(x, main = "Randomly Generated Data", prob = TRUE)

x.1 <- sort(x)
y <- dzipfman(x = x.1, s = 1.3, N = Inf)
lines(x.1, y, col = 2, lwd = 2)

plot(x.1, pzipfman(q = x.1, s = 1.3, N = Inf), type = "l", 
     xlab = "x", ylab = "Cumulative Probabilities")

qzipfman(p = 0.20, s = 1.3, lower.tail = FALSE, N = Inf)
qzipfman(p = 0.80, s = 1.3, N = Inf)



