library(FactoInvestigate)


### Name: inertiaDistrib
### Title: Inertia distribution analysis
### Aliases: inertiaDistrib
### Keywords: inertia

### ** Examples

## Not run: 
##D data(decathlon)
##D res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
##D inertiaDistrib(res.pca, q = 0.95, time = "10s")
##D 
##D data(children)
##D res.ca = CA(children, row.sup = 15:18, col.sup = 6:8, graph = FALSE)
##D inertiaDistrib(res.ca, q = 0.99, time = "10000L")
##D 
##D data(tea)
##D res.mca = MCA(tea, quanti.sup = 19,quali.sup = 20:36, graph = FALSE)
##D inertiaDistrib(res.mca, dim = 1:8, q = 0.90, time = "10s")
## End(Not run)



