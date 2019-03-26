library(SensoMineR)


### Name: panellipse
### Title: Confidence ellipses around products based on panelists
###   descriptions
### Aliases: panellipse
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## Example 1: PCA
##D data(chocolates)
##D res <- panellipse(sensochoc, col.p = 4, col.j = 1, firstvar = 5)
##D coltable(res$hotelling, main.title = "P-values for the Hotelling's T2 tests")
##D 
##D ## If we consider only 12 panelists in a virtual panel, 
##D ## what would be the size of the ellipses
##D res2 <- panellipse(sensochoc, col.p = 4, col.j = 1, nbchoix = 12, firstvar = 5)
##D coltable(res2$hotelling, main.title = "P-values for the Hotelling's T2 tests")
##D 
##D ## If we want the confidence ellipses around the individual descriptions
##D panellipse(sensochoc, col.p = 4, col.j = 1, nbchoix = 1, firstvar = 5)
##D 
##D 
##D ## Example 2: MFA
##D data(chocolates)
##D res <- panellipse(sensochoc, col.p = 4, col.j = 1, firstvar = 5, 
##D     group = c(6,8), name.group = c("G1","G2"))
##D for (i in 1:dim(res$hotelling$bygroup)[3]) coltable(res$hotelling$bygroup[,,i], 
##D     main.title = paste("P-values for the Hotelling's T2 tests (",
##D     dimnames(res$hotelling$bygroup)[3][[1]][i],")",sep=""))
## End(Not run)



