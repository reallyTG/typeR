library(rhmc)


### Name: num_grad
### Title: Numerical Gradient
### Aliases: num_grad

### ** Examples

func = function(x) exp(-0.5 * x ^ 2) / sqrt(2 * pi)
grad = function(x) -x * exp(-0.5 * x ^ 2) / sqrt(2 * pi)
num_grad(func, -2)
abs(num_grad(func, -2) - grad(-2))




