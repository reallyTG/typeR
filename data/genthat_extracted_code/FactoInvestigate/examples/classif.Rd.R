library(FactoInvestigate)


### Name: classif
### Title: Classification description
### Aliases: classif
### Keywords: classification

### ** Examples

## Not run: 
##D data(decathlon)
##D res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
##D classif(res.pca, file = "PCA.Rmd")
##D 
##D data(children)
##D res.ca = CA(children, row.sup = 15:18, col.sup = 6:8, graph = FALSE)
##D classif(res.ca, file = "CA.Rmd")
##D 
##D data(tea)
##D res.mca = MCA(tea, quanti.sup = 19,quali.sup = 20:36, graph = FALSE)
##D classif(res.mca, file = "MCA.Rmd")
## End(Not run)



