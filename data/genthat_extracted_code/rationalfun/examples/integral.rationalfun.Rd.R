library(rationalfun)


### Name: integral.rationalfun
### Title: Integrate a rational function
### Aliases: integral.rationalfun

### ** Examples

# (x + 1) / (x^2 + x + 1)
r <- rationalfun(c(1, 1), c(1, 1, 1))
expr <- integral(r)
# Evaluate the call directly
eval(expr, list(x = 2))
# Use int2fun()
f <- int2fun(expr)
f(2)



