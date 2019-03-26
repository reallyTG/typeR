library(originr)


### Name: nsr
### Title: Search the Native Species Resolver
### Aliases: nsr

### ** Examples

## Not run: 
##D nsr("Pinus ponderosa", country = "United States")
##D nsr(c("Pinus ponderosa", "Poa annua"), country = "United States")
##D splist <- c("Pinus ponderosa", "Poa annua", "bromus tectorum", "Ailanthus altissima")
##D nsr(splist, country = "United States")
##D nsr(splist, country = "United States", stateprovince = "California")
##D 
##D # curl options
##D nsr("Pinus ponderosa", "United States", verbose = TRUE)
## End(Not run)



