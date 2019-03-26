library(rnoaa)


### Name: ncdc_locs
### Title: Get metadata about NOAA NCDC locations.
### Aliases: ncdc_locs

### ** Examples

## Not run: 
##D # All locations, first 25 results
##D ncdc_locs()
##D 
##D # Fetch more information about location id FIPS:37
##D ncdc_locs(locationid='FIPS:37')
##D 
##D # Fetch available locations for the GHCND (Daily Summaries) dataset
##D ncdc_locs(datasetid='GHCND')
##D ncdc_locs(datasetid=c('GHCND', 'ANNUAL'))
##D ncdc_locs(datasetid=c('GSOY', 'ANNUAL'))
##D ncdc_locs(datasetid=c('GHCND', 'GSOM'))
##D 
##D # Fetch all U.S. States
##D ncdc_locs(locationcategoryid='ST', limit=52)
##D 
##D # Many locationcategoryid's
##D ## this apparently works, but returns nothing often with multiple
##D ## locationcategoryid's
##D ncdc_locs(locationcategoryid=c('ST', 'ZIP'))
##D 
##D # Fetch list of city locations in descending order
##D ncdc_locs(locationcategoryid='CITY', sortfield='name', sortorder='desc')
## End(Not run)



