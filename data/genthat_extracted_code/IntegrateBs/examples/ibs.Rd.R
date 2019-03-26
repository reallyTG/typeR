library(IntegrateBs)


### Name: ibs
### Title: Integration for B-splines
### Aliases: ibs

### ** Examples

library(splines)
f <- function(x) x + 2 * x^2 - 3 * x^3 
n <- 200
set.seed(123)
x <- runif(n)
y <- f(x) + rnorm(n, sd = 0.1)
kns <- c(rep(0, 4), 1:4 * 0.2, rep(1, 4))
bs.c <- splineDesign(kns, x, 4)
coeff <- as.matrix(lm(y ~ bs.c-1)$coefficients)
f.b <- function(x, coeff) splineDesign(kns, x, 4) %*% coeff
integrate(f.b, 0, 1, coeff)
ibs(1,kns,4,coeff)
integrate(f, 0, 1)
plot(x,y)
curve(f(x), add = TRUE)
points(x,fitted(lm(y~bs.c-1)),col="blue",lty=1)



