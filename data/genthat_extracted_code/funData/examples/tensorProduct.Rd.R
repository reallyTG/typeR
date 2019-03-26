library(funData)


### Name: tensorProduct
### Title: Tensor product for univariate functions on one-dimensional
###   domains
### Aliases: tensorProduct

### ** Examples


### Tensor product of two functional data objects
x <- seq(0, 2*pi, 0.1)
f1 <- funData(x, outer(seq(0.75, 1.25, 0.1), sin(x)))
y <- seq(-pi, pi, 0.1)
f2 <- funData(y, outer(seq(0.25, 0.75, 0.1), sin(y)))

plot(f1, main = "f1")
plot(f2, main = "f2")

tP <- tensorProduct(f1, f2)
dimSupp(tP)
plot(tP, obs = 1)

### Tensor product of three functional data objects
z <- seq(-1, 1, 0.05)
f3 <- funData(z, outer(seq(0.75, 1.25, 0.1), z^2))

plot(f1, main = "f1")
plot(f2, main = "f2")
plot(f3, main = "f3")

tP2 <- tensorProduct(f1, f2, f3)
dimSupp(tP2)



