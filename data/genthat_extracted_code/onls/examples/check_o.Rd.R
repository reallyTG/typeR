library(onls)


### Name: check_o
### Title: Check the fit for orthogonality of all points
### Aliases: check_o
### Keywords: optimize models nonlinear

### ** Examples

## Compare 'data range extended' orthogonal model with a
## 'data range restricted' model by setting "extend = c(0, 0)"
## => some x may not be orthogonal!
x <- 1:20
y <- 10 + 3*x^2
y <- sapply(y, function(a) rnorm(1, a, 0.1 * a))
DAT <- data.frame(x, y)

mod1 <- onls(y ~ a + b * x^2, data = DAT, start = list(a = 1, b = 1))
check_o(mod1)

mod2 <- onls(y ~ a + b * x^2, data = DAT, start = list(a = 1, b = 1),
             extend = c(0, 0)) 
check_o(mod2)



