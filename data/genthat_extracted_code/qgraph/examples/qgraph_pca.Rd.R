library(qgraph)


### Name: qgraph.pca
### Title: qgraph.pca
### Aliases: qgraph.pca

### ** Examples

## Not run: 
##D data(big5)
##D data(big5groups)
##D 
##D qgraph.pca(cor(big5),5,groups=big5groups,rotation="promax",minimum=0.2,
##D 			cut=0.4,vsize=c(1,7),borders=FALSE,vTrans=200)
##D 
##D # Tree layout:
##D qgraph.pca(cor(big5), 5,groups=big5groups, rotation="promax", minimum=0.2, 
##D   cut=0.4, vsize=c(1.5,7), borders=FALSE, layout="tree", width=20, filetype="R")
## End(Not run)



