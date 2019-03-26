library(ppclust)


### Name: gkpfcm
### Title: Gustafson-Kessel Clustering Using PFCM
### Aliases: gkpfcm
### Keywords: cluster

### ** Examples

## Not run: 
##D # Load dataset iris 
##D data(iris)
##D x <- iris[,-5]
##D 
##D # Initialize the prototype matrix using K-means++
##D v <- inaparc::kmpp(x, k=3)$v
##D 
##D # Initialize the memberships degrees matrix 
##D u <- inaparc::imembrand(nrow(x), k=3)$u
##D 
##D # Run FCM with the initial prototypes and memberships
##D gkpfcm.res <- gkpfcm(x, centers=v, memberships=u, m=2)
##D 
##D # Show the fuzzy membership degrees for the top 5 objects
##D head(gkpfcm.res$u, 5)
## End(Not run)



