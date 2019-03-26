library(ridigbio)


### Name: idig_search_records
### Title: Searching of iDigBio records
### Aliases: idig_search_records

### ** Examples

## Not run: 
##D # Simple example of retriving records in a genus:
##D idig_search_records(rq=list(genus="acer"), limit=10)
##D 
##D # This complex query shows that booleans passed to the API are represented
##D # as strings in R, fields used in the query don't have to be returned, and
##D # the syntax for accessing raw data fields:
##D idig_search_records(rq=list("hasImage"="true", genus="acer"), 
##D             fields=c("uuid", "data.dwc:verbatimLatitude"), limit=100)
##D 
##D # Searching inside a raw data field for a string, note that raw data fields
##D # are searched as full text, indexed fields are search with exact matches:
##D 
##D idig_search_records(rq=list("data.dwc:dynamicProperties"="parasite"), 
##D             fields=c("uuid", "data.dwc:dynamicProperties"), limit=100)
##D 
##D # Retriving a data.frame for use with MaxEnt. Notice geopoint is expanded
##D # to two columns in the data.frame: gepoint.lat and geopoint.lon:
##D df <- idig_search_records(rq=list(genus="acer", geopoint=list(type="exists")), 
##D           fields=c("uuid", "geopoint"), limit=10)
##D write.csv(df[c("uuid", "geopoint.lon", "geopoint.lat")], 
##D           file="acer_occurrences.csv", row.names=FALSE)
##D           
## End(Not run)



