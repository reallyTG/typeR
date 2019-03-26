library(rnoaa)


### Name: ncdc_locs_cats
### Title: Get metadata about NOAA location categories.
### Aliases: ncdc_locs_cats

### ** Examples

## Not run: 
##D # All location categories, first 25 results
##D ncdc_locs_cats()
##D 
##D # Find locations with category id of CLIM_REG
##D ncdc_locs_cats(locationcategoryid='CLIM_REG')
##D 
##D # Displays available location categories within GHCN-Daily dataset
##D ncdc_locs_cats(datasetid='GHCND')
##D ncdc_locs_cats(datasetid='GSOY')
##D ncdc_locs_cats(datasetid='ANNUAL')
##D 
##D # multiple datasetid's
##D ncdc_locs_cats(datasetid=c('GHCND', 'GSOM'))
##D 
##D # Displays available location categories from start date 1970-01-01
##D ncdc_locs_cats(startdate='1970-01-01')
## End(Not run)



