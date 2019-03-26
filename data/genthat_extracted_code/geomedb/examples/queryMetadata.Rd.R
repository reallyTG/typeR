library(geomedb)


### Name: queryMetadata
### Title: fetch the FimsMetadata from the geome-db database
### Aliases: queryMetadata

### ** Examples

## Not run: 
##D df <- queryMetadata(expeditions=list("TEST", "TEST2"))
##D df <- queryMetadata(names=list("materialSampleID", "bcid"), query="Chordata")
##D df <- queryMetadata(expeditions=list("TEST"), names=list("bcid"), query="+yearCollected:2008")
## End(Not run)



