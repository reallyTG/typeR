library(Renext)


### Name: SLTW
### Title: Shifted Left Truncated Weibull (SLTW) distribution
### Aliases: SLTW dSLTW pSLTW qSLTW rSLTW
### Keywords: distribution

### ** Examples

shape <- rexp(1)+1  
delta = 10

xl <- qSLTW(c(0.001, 0.99), delta = delta, shape = shape)
x <- seq(from = xl[1], to = xl[2], length.out = 200)
f <- dSLTW(x, delta = delta, shape = shape)
plot(x, f, type = "l", main = "SLTW density")

F <- pSLTW(x, delta = delta, shape = shape)
plot(x, F, type = "l", main = "SLTW distribution")

X <- rSLTW(5000, delta = delta, shape = shape)
## Should be close to the uniform repartition
plot(ecdf(pSLTW(X, delta = delta, shape = shape)))




