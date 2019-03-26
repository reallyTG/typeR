library(gmat)


### Name: ug-constrained covariance matrices
### Title: Simulation of covariance matrices.
### Aliases: 'ug-constrained covariance matrices' port diagdom

### ** Examples

## Partial orthogonalization
# Generate a full matrix (default behaviour)
port()

# Generate a matrix with a percentage of zeros
port(d = 0.5)
port(d = 0.5, zapzeros = FALSE) # no zero zap

# Generate a random undirected graph structure
ug <- rgraph(p = 3, d = 0.5)
igraph::print.igraph(ug)

# Generate a matrix complying with the predefined zero pattern
port(ug = ug)
port(ug = ug, zapzeros = FALSE) # no zero zap
## Diagonal dominance
# Generate a full matrix (default behaviour)
diagdom()

# Generate a matrix with a percentage of zeros
diagdom(d = 0.5)

# Generate a matrix complying with the predefined zero pattern
igraph::print.igraph(ug)
diagdom(ug = ug)



