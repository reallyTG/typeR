library(poweRlaw)


### Name: dpldis
### Title: Discrete power-law distribution
### Aliases: dpldis ppldis rpldis

### ** Examples

xmin = 1; alpha = 2
x = xmin:100

plot(x, dpldis(x, xmin, alpha), type="l")
plot(x, ppldis(x, xmin, alpha), type="l", main="Distribution function")
dpldis(1, xmin, alpha)

###############################################
## Random number generation                   #
###############################################
n = 1e5
x1 = rpldis(n, xmin, alpha)
## Compare with exact (dpldis(1, xmin, alpha))
sum(x1==1)/n
## Using only the approximation
x2 = rpldis(n, xmin, alpha, 0)
sum(x2==1)/n




