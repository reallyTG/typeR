library(ppclust)


### Name: gk
### Title: Gustafson-Kessel Clustering
### Aliases: gk
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
##D # Initialize the membership degrees matrix 
##D u <- inaparc::imembrand(nrow(x), k=3)$u
##D 
##D # Run FCM with the initial prototypes and memberships
##D gk.res <- gk(x, centers=v, memberships=u, m=2)
##D 
##D # Show the fuzzy membership degrees for the top 5 objects
##D head(gk.res$u, 5)
## End(Not run)



