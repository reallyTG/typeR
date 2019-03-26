library(SensoMineR)


### Name: panellipse.session
### Title: Repetability of panelists descriptions studied by confidence
###   ellipses around products per session
### Aliases: panellipse.session
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(chocolates)
##D res <- panellipse.session(sensochoc, col.p = 4, col.j = 1, col.s = 2, 
##D     firstvar = 5)
##D magicsort(res$variability)
##D for (i in 1:dim(res$hotelling$bysession)[3]) coltable(res$hotelling$bysession[,,i], 
##D     main.title = paste("P-values for the Hotelling's T2 tests (",
##D     dimnames(res$hotelling$bysession)[3][[1]][i],")",sep=""))
## End(Not run)



