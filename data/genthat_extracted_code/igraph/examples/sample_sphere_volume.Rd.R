library(igraph)


### Name: sample_sphere_volume
### Title: Sample vectors uniformly from the volume of a sphere
### Aliases: sample_sphere_volume

### ** Examples

lpvs.sph.vol <- sample_sphere_volume(dim=10, n=20, radius=1)
RDP.graph.4  <- sample_dot_product(lpvs.sph.vol)
vec.norm     <- apply(lpvs.sph.vol, 2, function(x) { sum(x^2) })
vec.norm



