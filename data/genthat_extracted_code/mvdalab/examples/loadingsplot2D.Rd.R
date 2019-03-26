library(mvdalab)


### Name: loadingsplot2D
### Title: 2-Dimensionsl Graphical Summary Information Pertaining to the
###   Loadings of a PLS or PCA Analysis
### Aliases: loadingsplot2D

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
loadingsplot2D(mod1, comp = c(1, 2))

## Not run: 
##D data(Penta)
##D mod2 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
##D                ncomp = 2, validation = "loo")
##D loadingsplot2D(mod2, comp = c(1, 2))
## End(Not run)

data(iris)
pc1 <- pcaFit(iris)
loadingsplot2D(pc1, comp = c(1, 2))



