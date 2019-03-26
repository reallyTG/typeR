library(eechidna)


### Name: weighted_avg_census
### Title: Function to compute weighted average of Census information using
###   imputed populations as weights
### Aliases: weighted_avg_census

### ** Examples

## Not run: 
##D data(abs2016)
##D 
##D # Each 2013 electorate boundary's composition in terms of the 
##D # boundaries in place for the 2016 Census
##D aec_sF_2013 <- loadShapeFile(path_to_aec_shapefile)
##D abs_sF_2016 <- loadShapeFile(path_to_abs_shapefile)
##D mapping_2016 <- mapping_fn(aec_sF = aec_sF_2013, abs_sF = abs_sF_2016)
##D 
##D # Estimate 2016 Census data for the 2013 electorates
##D imputed_data_2016 <- weighted_avg_census(mapping_df = mapping_2016, abs_df = abs2016)
## End(Not run)



