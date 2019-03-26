library(VGAM)


### Name: Coef.qrrvglm-class
### Title: Class "Coef.qrrvglm"
### Aliases: Coef.qrrvglm-class
### Keywords: classes

### ** Examples

x2 <- rnorm(n <- 100)
x3 <- rnorm(n)
x4 <- rnorm(n)
latvar1 <- 0 + x3 - 2*x4
lambda1 <- exp(3 - 0.5 * ( latvar1-0)^2)
lambda2 <- exp(2 - 0.5 * ( latvar1-1)^2)
lambda3 <- exp(2 - 0.5 * ((latvar1+4)/2)^2)
y1 <- rpois(n, lambda1)
y2 <- rpois(n, lambda2)
y3 <- rpois(n, lambda3)
yy <- cbind(y1, y2, y3)
# vvv p1 <- cqo(yy ~ x2 + x3 + x4, fam = poissonff, trace = FALSE)
## Not run: 
##D lvplot(p1, y = TRUE, lcol = 1:3, pch = 1:3, pcol = 1:3)
## End(Not run)
# vvv print(Coef(p1), digits = 3)



