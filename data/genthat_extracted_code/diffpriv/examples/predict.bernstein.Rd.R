library(diffpriv)


### Name: predict.bernstein
### Title: Evaluate Bernstein approximations on data.
### Aliases: predict.bernstein

### ** Examples

f <- function(x) x * sin(x*10)
b <- bernstein(f, dims = 1)
xs <- seq(from=0, to=1, length=50)
mean((f(xs) - predict(b,xs))^2)




