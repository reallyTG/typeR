library(pracma)


### Name: fornberg
### Title: Fornberg's Finite Difference Approximation
### Aliases: fornberg
### Keywords: fitting

### ** Examples

x <- 2 * pi * c(0.0, 0.07, 0.13, 0.2, 0.28, 0.34, 0.47, 0.5, 0.71, 0.95, 1.0)
y <- sin(0.9*x)
xs <- linspace(0, 2*pi, 51)
fornb <- fornberg(x, y, xs, 10)
## Not run: 
##D matplot(xs, fornb, type="l")
##D grid()
## End(Not run)



