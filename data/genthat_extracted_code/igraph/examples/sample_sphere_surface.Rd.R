library(igraph)


### Name: sample_sphere_surface
### Title: Sample vectors uniformly from the surface of a sphere
### Aliases: sample_sphere_surface

### ** Examples

lpvs.sph    <- sample_sphere_surface(dim=10, n=20, radius=1)
RDP.graph.3 <- sample_dot_product(lpvs.sph)
vec.norm    <- apply(lpvs.sph, 2, function(x) { sum(x^2) })
vec.norm



