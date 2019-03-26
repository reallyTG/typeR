library(SensoMineR)


### Name: panelmatch
### Title: Confidence ellipses around products based on panel descriptions
### Aliases: panelmatch
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(chocolates)
##D Panel1=sensochoc[as.numeric(sensochoc[,1])<11,]
##D Panel2=sensochoc[as.numeric(sensochoc[,1])<21 & as.numeric(sensochoc[,1])>10,]
##D Panel3=sensochoc[as.numeric(sensochoc[,1])>20,]
##D res <- panelmatch(list(P1=Panel1,P2=Panel2,P3=Panel3), col.p = 4, col.j = 1, firstvar = 5)
## End(Not run)



