library(diffpriv)


### Name: bernstein
### Title: Fit a Bernstein polynomial approximation.
### Aliases: bernstein

### ** Examples

f <- function(x) x * sin(x*10)
b <- bernstein(f, dims = 1)
xs <- seq(from=0, to=1, length=50)
mean((f(xs) - predict(b,xs))^2)




