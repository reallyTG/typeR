library(rgbif)


### Name: occ_count
### Title: Get number of occurrence records.
### Aliases: occ_count

### ** Examples

## Not run: 
##D occ_count(basisOfRecord='OBSERVATION')
##D occ_count(georeferenced=TRUE)
##D occ_count(country='DE')
##D occ_count(country='CA', georeferenced=TRUE, basisOfRecord='OBSERVATION')
##D occ_count(datasetKey='9e7ea106-0bf8-4087-bb61-dfe4f29e0f17')
##D occ_count(year=2012)
##D occ_count(taxonKey=2435099)
##D occ_count(taxonKey=2435099, georeferenced=TRUE)
##D occ_count(protocol='DWC_ARCHIVE')
##D 
##D # Just schema
##D occ_count(type='schema')
##D 
##D # Counts by basisOfRecord types
##D occ_count(type='basisOfRecord')
##D 
##D # Counts by basisOfRecord types
##D occ_count(typeStatus='ALLOTYPE')
##D occ_count(typeStatus='HOLOTYPE')
##D 
##D # Counts by countries. publishingCountry must be supplied (default to US)
##D occ_count(type='countries')
##D 
##D # Counts by year. from and to years have to be supplied, default to 2000
##D # and 2012
##D occ_count(type='year', from=2000, to=2012)
##D 
##D # Counts by publishingCountry, must supply a country (default to US)
##D occ_count(type='publishingCountry')
##D occ_count(type='publishingCountry', country='BZ')
##D 
##D # Pass on curl options
##D occ_count(type='year', from=2000, to=2012, curlopts = list(verbose = TRUE))
## End(Not run)



