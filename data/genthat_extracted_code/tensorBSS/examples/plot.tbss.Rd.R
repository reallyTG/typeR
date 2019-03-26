library(tensorBSS)


### Name: plot.tbss
### Title: Plot an Object of the Class tbss
### Aliases: plot.tbss
### Keywords: methods

### ** Examples

library(ElemStatLearn)
x <- zip.train

rows <- which(x[, 1] == 0 | x[, 1] == 1)
x0 <- x[rows, 2:257]
y0 <- x[rows, 1] + 1

x0 <- t(x0)
dim(x0) <- c(16, 16, 2199)

tfobi <- tFOBI(x0)
plot(tfobi, col=y0)

library("stochvol")
n <- 1000
S <- t(cbind(svsim(n, mu = -10, phi = 0.98, sigma = 0.2, nu = Inf)$y,
             svsim(n, mu = -5, phi = -0.98, sigma = 0.2, nu = 10)$y,
             svsim(n, mu = -10, phi = 0.70, sigma = 0.7, nu = Inf)$y,
             svsim(n, mu = -5, phi = -0.70, sigma = 0.7, nu = 10)$y,
             svsim(n, mu = -9, phi = 0.20, sigma = 0.01, nu = Inf)$y,
             svsim(n, mu = -9, phi = -0.20, sigma = 0.01, nu = 10)$y))
dim(S) <- c(3, 2, n)

A1 <- matrix(rnorm(9), 3, 3)
A2 <- matrix(rnorm(4), 2, 2)

X <- tensorTransform(S, A1, 1)
X <- tensorTransform(X, A2, 2)

tgfobi <- tgFOBI(X)
plot(tgfobi, 1, 1)



