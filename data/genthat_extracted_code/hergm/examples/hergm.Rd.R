library(hergm)


### Name: hergm
### Title: Hierarchical exponential-family random graph models with local
###   dependence
### Aliases: hergm

### ** Examples

## Not run: 
##D data(example)
##D hergm(d ~ edges_i)
##D hergm(d ~ edges_ij)
##D hergm(d ~ edges_ij + triangle_ijk)
##D 
##D data(sampson)
##D hergm(samplike ~ arcs_i + arcs_j)
##D hergm(samplike ~ edges_ij + mutual_ij)
##D hergm(samplike ~ edges_ij + mutual_ij + ttriple_ijk)
## End(Not run)



