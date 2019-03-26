library(ppclust)


### Name: gg
### Title: Gath-Geva Clustering Algorithm
### Aliases: gg
### Keywords: cluster

### ** Examples

## Not run: 
##D # Load dataset iris 
##D data(iris)
##D x <- iris[,-5]
##D 
##D # Initialize the prototype matrix using Inofrep algorithm
##D v <- inaparc::inofrep(x, k=3)$v
##D # Initialize the memberships degrees matrix 
##D u <- inaparc::imembrand(nrow(x), k=3)$u
##D 
##D # Run Gath & Geva with the initial prototypes and memberships
##D gg.res <- gg(x, centers=v, memberships=u, m=2)
##D 
##D # Show the fuzzy memberships degrees for the top 5 objects
##D head(gg.res$u, 5)
## End(Not run)



