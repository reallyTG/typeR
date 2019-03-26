library(snotelr)


### Name: snotel_phenology
### Title: Calculates snow phenology from the snow water equivalent data
### Aliases: snotel_phenology
### Keywords: SNOTEL, USDA, cover phenology, series, snow time

### ** Examples


## Not run: 
##D # download one of the longer time series
##D df <- snotel_download(site_id = 670, internal = TRUE)
##D 
##D # calculate the snow phenology
##D phenology <- snotel_phenology(df)
##D 
##D # show a couple of lines
##D head(phenology)
##D 
## End(Not run)



