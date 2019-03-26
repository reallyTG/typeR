library(copula)


### Name: contourplot2-methods
### Title: Contour Plot Methods 'contourplot2' in Package 'copula'
### Aliases: contourplot2 contourplot2-methods contourplot2,matrix-method
###   contourplot2,data.frame-method contourplot2,Copula-method
###   contourplot2,mvdc-method
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
contourplot2(x.W) # contour plot of W
contourplot2(x.M) # contour plot of M

## For 'Copula' objects
cop <- frankCopula(-4)
contourplot2(cop, pCopula) # the copula
contourplot2(cop, pCopula, xlab = "x", ylab = "y") # adjusting the labels
contourplot2(cop, dCopula) # the density

## For 'mvdc' objects
mvNN <- mvdc(gumbelCopula(3), c("norm", "norm"),
             list(list(mean = 0, sd = 1), list(mean = 1)))
xl <- c(-2, 2)
yl <- c(-1, 3)
contourplot2(mvNN, FUN = dMvdc, xlim = xl, ylim = yl, contour = FALSE)
contourplot2(mvNN, FUN = dMvdc, xlim = xl, ylim = yl)
contourplot2(mvNN, FUN = dMvdc, xlim = xl, ylim = yl, region = FALSE, labels = FALSE)
contourplot2(mvNN, FUN = dMvdc, xlim = xl, ylim = yl, region = FALSE)
contourplot2(mvNN, FUN = dMvdc, xlim = xl, ylim = yl,
             col.regions = colorRampPalette(c("royalblue3", "maroon3"), space="Lab"))



