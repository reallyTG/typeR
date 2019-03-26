library(copula)


### Name: wireframe2-methods
### Title: Perspective Plots - 'wireframe2' in Package 'copula'
### Aliases: wireframe2 wireframe2-methods wireframe2,matrix-method
###   wireframe2,data.frame-method wireframe2,Copula-method
###   wireframe2,mvdc-method
### Keywords: methods hplot

### ** Examples

## For 'matrix' objects
## The Frechet--Hoeffding bounds W and M
n.grid <- 26
u <- seq(0, 1, length.out = n.grid)
grid <- expand.grid("u[1]" = u, "u[2]" = u)
W <- function(u) pmax(0, rowSums(u)-1) # lower bound W
M <- function(u) apply(u, 1, min) # upper bound M
x.W <- cbind(grid, "W(u[1],u[2])" = W(grid)) # evaluate W on 'grid'
x.M <- cbind(grid, "M(u[1],u[2])" = M(grid)) # evaluate M on 'grid'
wireframe2(x.W)
wireframe2(x.W, shade = TRUE) # plot of W
wireframe2(x.M, drape = TRUE) # plot of M

## For 'Copula' objects
cop <- frankCopula(-4)
wireframe2(cop, pCopula) # the copula
wireframe2(cop, pCopula, shade = TRUE) # ditto, "shaded"
wireframe2(cop, pCopula, shade = TRUE, col = "gray60") # ditto, "shaded"+grid
wireframe2(cop, pCopula, drape = TRUE, xlab = quote(x[1])) # adjusting an axis label
wireframe2(cop, dCopula, delta=0.01) # the density
wireframe2(cop, dCopula) # => the density is set to 0 on the margins
wireframe2(cop, function(u, copula) dCopula(u, copula, log=TRUE),
           zlab = list(quote(log(c(u[1],u[2]))), rot=90), main = "dCopula(.., log=TRUE)")


## For 'mvdc' objects
mvNN <- mvdc(gumbelCopula(3), c("norm", "norm"),
             list(list(mean = 0, sd = 1), list(mean = 1)))
wireframe2(mvNN, dMvdc, xlim=c(-2, 2), ylim=c(-1, 3))



