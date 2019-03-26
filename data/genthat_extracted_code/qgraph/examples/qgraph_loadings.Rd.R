library(qgraph)


### Name: qgraph.loadings
### Title: qgraph.loadings
### Aliases: qgraph.loadings

### ** Examples

## Not run: 
##D # Load big5 dataset:
##D data(big5)
##D data(big5groups)
##D 
##D big5efa <- factanal(big5,factors=5,rotation="promax",scores="regression")
##D big5loadings <- loadings(big5efa)
##D qgraph.loadings(big5loadings,groups=big5groups,rotation="promax",minimum=0.2,
##D 				cut=0.4,vsize=c(1.5,15),borders=FALSE,vTrans=200)
##D 
##D # Tree layout:
##D qgraph.loadings(big5loadings,groups=big5groups,rotation="promax",minimum=0.2,
##D 				cut=0.4,vsize=c(1.5,15),borders=FALSE,vTrans=200,
##D 				layout="tree",width=20,filetype="R")
## End(Not run)



