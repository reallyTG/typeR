library(rdfp)


### Name: dfp_select
### Title: PublisherQueryLanguageService
### Aliases: dfp_select

### ** Examples

## Not run: 
##D  request_data <- list(selectStatement=
##D  list(query='SELECT Id, Name, Targeting FROM LineItem LIMIT 3')) 
##D  dfp_select_result <- dfp_select(request_data)
##D  
##D  request_data <- list(selectStatement=
##D  list(query="SELECT Id
##D                   , Name
##D                   , CanonicalParentId
##D                   , CountryCode
##D                   , Type 
##D              FROM Geo_Target 
##D              WHERE CountryCode='US' AND (TYPE='STATE' OR TYPE='COUNTY')"))
##D  us_geos <- dfp_select(request_data)
## End(Not run)



