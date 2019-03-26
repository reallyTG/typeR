library(hergm)


### Name: hergm-terms
### Title: Model terms
### Aliases: hergm.terms terms-hergm terms.hergm edges_i arcs_i arcs_j
###   edges_ij mutual_i mutual_ij twostar_ijk transitiveties_ijk
###   triangle_ijk ttriple_ijk ctriple_ijk

### ** Examples

## Not run: 
##D data(example)
##D # p_1 model: undirected network
##D hergm(d ~ edges_i)
##D 
##D data(sampson) 
##D # p_1 model: directed network
##D hergm(samplike ~ arcs_i + arcs_j + mutual)
##D 
##D data(example)
##D # Stochastic block model: undirected network 
##D hergm(d ~ edges_ij)
##D 
##D data(sampson) 
##D # Stochastic block model: directed network 
##D hergm(samplike ~ edges_ij + mutual)
##D 
##D data(example)
##D # Exponential-family random graph model with local dependence: undirected network
##D hergm(d ~ edges_ij + triangle_ijk)
##D 
##D data(sampson) 
##D # Exponential-family random graph model with local dependence: directed network
##D hergm(samplike ~ edges + mutual + ttriple_ijk)
## End(Not run)



