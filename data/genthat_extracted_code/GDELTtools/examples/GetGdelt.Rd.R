library(GDELTtools)


### Name: GetGDELT
### Title: Download and subset GDELT data
### Aliases: GetGDELT

### ** Examples

## Not run: 
##D test.filter <- list(ActionGeo_ADM1Code=c("NI", "US"), ActionGeo_CountryCode="US")
##D test.results <- GetGDELT(start.date="1979-01-01", end.date="1979-12-31",
##D   filter=test.filter)
##D table(test.results$ActionGeo_ADM1Code)
##D table(test.results$ActionGeo_CountryCode)
## End(Not run)

# Specify a local folder to store the downloaded files
## Not run: 
##D test.results <- GetGDELT(start.date="1979-01-01", end.date="1979-12-31",
##D                          filter=test.filter,
##D                          local.folder="~/gdeltdata",
##D                          max.local.mb=500)
## End(Not run)



