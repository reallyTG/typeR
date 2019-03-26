library(pracma)


### Name: pade
### Title: Pade Approximation
### Aliases: pade
### Keywords: math

### ** Examples

##  Exponential function
p1 <- c(1/24, 1/6, 1/2, 1.0, 1.0)  # Taylor series of exp(x) at x=0
R  <- pade(p1); r1 <- R$r1; r2 <- R$r2
f1 <- function(x) polyval(r1, x) / polyval(r2, x)
## Not run: 
##D xs <- seq(-1, 1, length.out=51); ys1 <- exp(xs); ys2 <- f1(xs)
##D plot(xs, ys1, type = "l", col="blue")
##D lines(xs, ys2, col = "red")
##D grid()
## End(Not run)



