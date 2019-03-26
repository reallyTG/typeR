library(hddtools)


### Name: catalogueSEPA
### Title: Data source: SEPA catalogue
### Aliases: catalogueSEPA

### ** Examples

## Not run: 
##D   # Retrieve the whole catalogue
##D   SEPA_catalogue_all <- catalogueSEPA()
##D 
##D   # Get only catchments with area above 5000 Km2
##D   SEPA_catalogue_area <- catalogueSEPA(columnName = "CatchmentAreaKm2",
##D                                        columnValue = ">= 5000")
##D 
##D   # Get only catchments within river Avon
##D   SEPA_catalogue_river <- catalogueSEPA(columnName = "River",
##D                                         columnValue = "Avon")
## End(Not run)




