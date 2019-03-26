library(cocoreg)


### Name: variation_shared_by
### Title: Return a specific variation component
### Aliases: variation_shared_by

### ** Examples

## Not run: 
##D dc <- create_syn_data_toy()
##D ldSharedByAll = variation_shared_by(dc, "all", center = F) 
##D ldSharedBySome = variation_shared_by(dc, "subset", center = F) 
##D ldNonUnique = variation_shared_by(dc, "all_and_subset", center = F) 
##D dNoise <- mapply(function(x,y){x-y}, x=dc$data, y=ldNonUnique, SIMPLIFY = F)
##D ggplot_dclst(list(observed = dc$data,
##D                 shared.by.all = ldSharedByAll,
##D                 shared.by.some = ldSharedBySome,
##D                 noise = dNoise),
##D             ylim = c(-3, 3))
## End(Not run)




