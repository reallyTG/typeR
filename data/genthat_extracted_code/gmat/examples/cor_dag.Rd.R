library(gmat)


### Name: dag-constrained correlation matrices
### Title: Simulation of correlation matrices
### Aliases: 'dag-constrained correlation matrices' chol_mh chol_iid
###   chol_polar

### ** Examples

## Cholesky sampling via Metropolis-Hastings
# Generate a full matrix (default behaviour)
chol_mh()

# Generate a matrix with a percentage of zeros
chol_mh(d = 0.5)

# Generate a random acyclic digraph structure
dag <- rgraph(p = 3, d = 0.5, dag = TRUE)
igraph::print.igraph(dag)

# Generate a matrix complying with the predefined zero pattern
chol_mh(dag = dag)
## Cholesky sampling via i.i.d. Cholesky factor
# Generate a full matrix (default behaviour)
chol_iid()

# Generate a matrix with a percentage of zeros
chol_iid(d = 0.5)

# Generate a matrix complying with the predefined zero pattern
igraph::print.igraph(dag)
chol_iid(dag = dag)
## Cholesky sampling via polar parametrization of the upper Cholesky factor
# Generate a full matrix (default behaviour)
chol_polar()

# Generate a matrix with a percentage of zeros
chol_polar(d = 0.5)

# Generate a matrix complying with the predefined zero pattern
igraph::print.igraph(dag)
chol_polar(dag = dag)

# Performance comparison of numeric vs recursive integral (full matrix)
system.time(chol_polar(N = 10, p = 5))
system.time(chol_polar(N = 10, p = 5, comp = "recursive"))



