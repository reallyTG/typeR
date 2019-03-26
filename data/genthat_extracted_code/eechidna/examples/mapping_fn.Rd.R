library(eechidna)


### Name: mapping_fn
### Title: Compute areas of intersection between each election boundary and
###   those in the Census of interest.
### Aliases: mapping_fn

### ** Examples

## Not run: 
##D # Each 2013 electorate boundary's composition in terms of the 
##D # boundaries in place for the 2016 Census
##D aec_sF_2013 <- loadShapeFile(path_to_aec_shapefile)
##D abs_sF_2016 <- loadShapeFile(path_to_abs_shapefile)
##D 
##D mapping_df <- mapping_fn(aec_sF = aec_sF_2013, abs_sF = abs_sF_2016, area_thres = 0.995)
## End(Not run)



