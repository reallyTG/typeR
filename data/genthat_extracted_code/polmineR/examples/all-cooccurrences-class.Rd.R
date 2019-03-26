library(polmineR)


### Name: Cooccurrences-class
### Title: Cooccurrences class for corpus/partition.
### Aliases: Cooccurrences-class as_igraph
###   as.simple_triplet_matrix,Cooccurrences-method
###   as_igraph,Cooccurrences-method subset,Cooccurrences-method
###   decode,Cooccurrences-method kwic,Cooccurrences-method
###   as.sparseMatrix,Cooccurrences-method

### ** Examples

X <- Cooccurrences("REUTERS", p_attribute = "word", left = 2L, right = 2L)
m <- as.simple_triplet_matrix(X)
## Not run: 
##D X <- Cooccurrences("REUTERS", p_attribute = "word", left = 5L, right = 5L)
##D decode(X)
##D sm <- as.sparseMatrix(X)
##D stm <- as.simple_triplet_matrix(X)
## End(Not run)



