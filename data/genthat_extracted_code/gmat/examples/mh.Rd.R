library(gmat)


### Name: metropolis-hastings sampling
### Title: Upper Cholesky factor sampling using Metropolis-Hastings
### Aliases: 'metropolis-hastings sampling' mh_u mh_sphere

### ** Examples

## Upper Cholesky factor sampling 
# Generate a random acyclic digraph 
dag <- rgraph(p = 3, d = 0.5, dag = TRUE)
igraph::print.igraph(dag)

# Generate an upper Cholesky factor complying with such zero pattern
mh_u(dag = dag)
# We may also generate it with no zero pattern (full upper triangular)
mh_u()
## Hemisphere sampling
# 3D hemisphere from a density proportional to the square of the first coordinate
mh_sphere(N = 4, k = 3, i = 2)



