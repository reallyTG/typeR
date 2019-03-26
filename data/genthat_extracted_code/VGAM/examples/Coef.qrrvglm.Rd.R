library(VGAM)


### Name: Coef.qrrvglm
### Title: Returns Important Matrices etc. of a QO Object
### Aliases: Coef.qrrvglm
### Keywords: models regression

### ** Examples

set.seed(123)
x2 <- rnorm(n <- 100)
x3 <- rnorm(n)
x4 <- rnorm(n)
latvar1 <- 0 + x3 - 2*x4
lambda1 <- exp(3 - 0.5 * ( latvar1-0)^2)
lambda2 <- exp(2 - 0.5 * ( latvar1-1)^2)
lambda3 <- exp(2 - 0.5 * ((latvar1+4)/2)^2)  # Unequal tolerances
y1 <- rpois(n, lambda1)
y2 <- rpois(n, lambda2)
y3 <- rpois(n, lambda3)
set.seed(111)
# vvv p1 <- cqo(cbind(y1, y2, y3) ~ x2 + x3 + x4, poissonff, trace = FALSE)
## Not run:  lvplot(p1, y = TRUE, lcol = 1:3, pch = 1:3, pcol = 1:3)

# vvv Coef(p1)
# vvv print(Coef(p1), digits=3)



