library(nlsr)


### Name: nlsDeriv
### Title: Functions to take symbolic derivatives.
### Aliases: nlsDeriv codeDeriv fnDeriv newDeriv sysDerivs
### Keywords: math nonlinear

### ** Examples

newDeriv()
newDeriv(sin(x))
nlsDeriv(~ sin(x+y), "x")

f <- function(x) x^2
newDeriv(f(x), 2*x*D(x))
nlsDeriv(~ f(abs(x)), "x")

nlsDeriv(~ pnorm(x, sd=2, log = TRUE), "x")
fnDeriv(~ pnorm(x, sd = sd, log = TRUE), "x")
f <- fnDeriv(~ pnorm(x, sd = sd, log = TRUE), "x", args = alist(x =, sd = 2))
f
f(1)
100*(f(1.01) - f(1))  # Should be close to the gradient
                      # The attached gradient attribute (from f(1.01)) is
                      # meaningless after the subtraction.
# Multiple point example
xvals <- c(1, 3, 4.123)
print(f(xvals))
# Getting a hessian matrix
f2 <- ~ (x-2)^3*y - y^2
mydf2 <- fnDeriv(f2, c("x","y"), hessian=TRUE)
# display the resulting function
print(mydf2)
x <- c(1, 2)
y <- c(0.5, 0.1)
evalmydf2 <- mydf2(x, y)
print(evalmydf2)
# the first index of the hessian attribute is the point at which we want the hessian
hmat1 <- as.matrix(attr(evalmydf2,"hessian")[1,,])
print(hmat1)
hmat2 <- as.matrix(attr(evalmydf2,"hessian")[2,,])
print(hmat2)




