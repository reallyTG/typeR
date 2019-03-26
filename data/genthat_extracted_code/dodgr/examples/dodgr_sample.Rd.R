library(dodgr)


### Name: dodgr_sample
### Title: dodgr_sample
### Aliases: dodgr_sample

### ** Examples

graph <- weight_streetnet (hampi)
nrow (graph) # 5,742
graph <- dodgr_sample (graph, nverts = 200)
nrow (graph) # generally around 400 edges
nrow (dodgr_vertices (graph)) # 200



