library(netdiffuseR)


### Name: vertex_covariate_compare
### Title: Comparisons at dyadic level
### Aliases: vertex_covariate_compare

### ** Examples


# Basic example ------------------------------------------------------------
set.seed(1313)
G <- rgraph_ws(10, 4, .2)
x <- rnorm(10)

vertex_covariate_compare(G, x, "distance")
vertex_covariate_compare(G, x, "^2")
vertex_covariate_compare(G, x, ">=")
vertex_covariate_compare(G, x, "<=")



