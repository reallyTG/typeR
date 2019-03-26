library(SensoMineR)


### Name: plotellipse
### Title: Plot confidence ellipses
### Aliases: plotellipse
### Keywords: dplot internal

### ** Examples

## Not run: 
##D data(chocolates)
##D donnee <- cbind.data.frame(sensochoc[,c(1,4,5:18)])
##D axe <- construct.axes(donnee, scale.unit = TRUE)
##D simul <- simulation(axe)
##D plotellipse (simul, alpha = 0.05, eig = signif(axe$eig,4))
##D #######################################
##D donnee <- cbind.data.frame(sensochoc[,c(1,4,5:18)])
##D axe <- construct.axes(donnee, group = c(6,8), 
##D     name.group = c("A-F","T-S"),scale.unit = TRUE)
##D simul <- simulation(axe, nbgroup = (ncol(axe$partiel)-2)/(ncol(axe$moyen)-2))
##D plotellipse (simul, alpha = 0.05, eig = signif(axe$eig,4))
## End(Not run)


