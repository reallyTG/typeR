library(pracma)


### Name: bernstein
### Title: Bernstein Polynomials
### Aliases: bernstein bernsteinb
### Keywords: math

### ** Examples

## Example
f <- function(x) sin(2*pi*x)
xs <- linspace(0, 1)
ys <- f(xs)
## Not run: 
##D plot(xs, ys, type='l', col="blue",
##D      main="Bernstein Polynomials")
##D grid()
##D b10  <- bernstein(f,  10, xs)
##D b100 <- bernstein(f, 100, xs)
##D lines(xs, b10,  col="magenta")
##D lines(xs, b100, col="red") 
## End(Not run)

# Bernstein basis polynomials
## Not run: 
##D xs <- linspace(0, 1)
##D plot(c(0,1), c(0,1), type='n',
##D      main="Bernstein Basis Polynomials")
##D grid()
##D n = 10
##D for (i in 0:n) {
##D     bs <- bernsteinb(i, n, xs)
##D     lines(xs, bs, col=i+1)
##D } 
## End(Not run)



