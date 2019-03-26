library(dils)


### Name: RelationStrengthSimilarity
### Title: Calculate the RSS from one node to another.
### Aliases: RelationStrengthSimilarity

### ** Examples

g1 <- graph.atlas(128)
## Not run: plot(g1)

M1 <- as.matrix(get.adjacency(g1))
M1
RelationStrengthSimilarity(xadj=M1, v1=5, v2=6, radius=1)
RelationStrengthSimilarity(xadj=M1, v1=5, v2=6, radius=2)
RelationStrengthSimilarity(xadj=M1, v1=5, v2=6, radius=3)
RelationStrengthSimilarity(xadj=M1, v1=5, v2=6, radius=4)

RelationStrengthSimilarity(xadj=M1, radius=2)

TestUndirectedNetwork <- function(n) {
  M <- matrix(runif(n*n), nrow=n)
  M <- (M + t(M)) / 2
  diag(M) <- 0
  return(M)
}
M2 <- TestUndirectedNetwork(75)
system.time(RelationStrengthSimilarity(xadj=M2, directed=FALSE, method="BetterR"))  # all R
system.time(RelationStrengthSimilarity(xadj=M2, directed=FALSE))                    # Rcpp



