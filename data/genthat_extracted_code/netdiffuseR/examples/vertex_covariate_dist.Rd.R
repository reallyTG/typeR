library(netdiffuseR)


### Name: vertex_covariate_dist
### Title: Computes covariate distance between connected vertices
### Aliases: vertex_covariate_dist p-norm mahalanobis minkowski
###   vertex_mahalanobis_dist

### ** Examples

# Distance (aka p norm) -----------------------------------------------------
set.seed(123)
G <- rgraph_ws(20, 4, .1)
X <- matrix(runif(40), ncol=2)

vertex_covariate_dist(G, X)

# Mahalanobis distance ------------------------------------------------------
S <- var(X)

M <- vertex_mahalanobis_dist(G, X, S)

# Example with diffnet objects ----------------------------------------------

data(medInnovationsDiffNet)
X <- cbind(
  medInnovationsDiffNet[["proage"]],
  medInnovationsDiffNet[["attend"]]
)

S <- var(X, na.rm=TRUE)
ans <- vertex_mahalanobis_dist(medInnovationsDiffNet, X, S)




