library(SUMMER)


### Name: countrySummary_mult
### Title: Obtain the Horvitz-Thompson direct estimates and standard errors
###   using delta method for multiple surveys.
### Aliases: countrySummary_mult

### ** Examples

## Not run: 
##D data(DemoData)
##D years <- c("85-89", "90-94", "95-99", "00-04", "05-09", "10-14")
##D u5m <- countrySummary_mult(births = DemoData, years = years, idVar = "id", 
##D regionVar = "region", timeVar = "time", clusterVar = "~clustid+id", 
##D ageVar = "age", weightsVar = "weights", geo.recode = NULL)
## End(Not run)



