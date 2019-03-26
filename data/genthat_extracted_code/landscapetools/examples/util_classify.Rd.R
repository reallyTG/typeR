library(landscapetools)


### Name: util_classify
### Title: util_classify
### Aliases: util_classify

### ** Examples

weight <- c(0.5, 0.25, 0.25)
util_classify(fbmmap, weight,
              level_names = c("Land Use 1", "Land Use 2", "Land Use 3"))

## Not run: 
##D rland <- util_classify(NLMR::nlm_planargradient(200,200),
##D                          c(.4,.2,.4),
##D                          c("Land use 1", "Water", "Land use 2"))
##D 
##D resu <- util_classify(fbmmap, real_land = rland)
##D resu_mask <- util_classify(fbmmap, real_land = rland, mask_val = 1)
##D 
##D visu <- list(
##D '1 nlm' = fbmmap,
##D '2 real' = rland,
##D '3 result' = resu,
##D '4 result with mask' = resu_mask
##D )
##D util_facetplot(visu)
## End(Not run)




