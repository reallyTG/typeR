library(FactoInvestigate)


### Name: factoGraph
### Title: Factorial graphs
### Aliases: factoGraph
### Keywords: graphs

### ** Examples

require(FactoMineR)
data(decathlon)
res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
factoGraph(res.pca)

## Not run: 
##D require(FactoMineR)
##D data(children)
##D res.ca = CA(children, row.sup = 15:18, col.sup = 6:8, graph = FALSE)
##D factoGraph(res.ca)
##D 
##D data(tea)
##D res.mca = MCA(tea, quanti.sup = 19,quali.sup = 20:36, graph = FALSE)
##D factoGraph(res.mca)
## End(Not run)



