library(NLMR)


### Name: nlm_neigh
### Title: nlm_neigh
### Aliases: nlm_neigh

### ** Examples

# simulate neighborhood model
neigh_raster <- nlm_neigh(ncol = 50, nrow = 50, p_neigh = 0.7, p_empty = 0.1,
                    categories = 5, neighbourhood = 4)

## Not run: 
##D # visualize the NLM
##D landscapetools::show_landscape(neigh_raster)
## End(Not run)




