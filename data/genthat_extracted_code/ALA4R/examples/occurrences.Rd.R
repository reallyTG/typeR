library(ALA4R)


### Name: occurrences
### Title: Get occurrence data
### Aliases: occurrences

### ** Examples

## Not run: 
##D ## count of records from this data provider
##D x <- occurrences(taxon="data_resource_uid:dr356",record_count_only=TRUE)
##D ## download records, with standard fields
##D x <- occurrences(taxon="data_resource_uid:dr356",download_reason_id=10)
##D ## download records, with all fields
##D x <- occurrences(taxon="data_resource_uid:dr356",download_reason_id=10,
##D   fields=ala_fields("occurrence_stored",as_is=TRUE)$name) 
##D ## download records, with specified fields
##D x <- occurrences(taxon="genus:Heleioporus",fields=c("longitude","latitude",
##D   "common_name","taxon_name","el807"),download_reason_id=10)
##D  ## download records in polygon, with no quality assertion information
##D x <- occurrences(taxon="genus:Heleioporus",
##D   wkt="POLYGON((145 -37,150 -37,150 -30,145 -30,145 -37))",
##D   download_reason_id=10,qa="none")
##D 
##D y <- occurrences(taxon="taxon_name:\"Alaba vibex\"",fields=c("latitude","longitude","el874"),
##D   download_reason_id=10)
##D str(y)
##D # equivalent direct webservice call [see this by setting ala_config(verbose=TRUE)]:
##D # http://biocache.ala.org.au/ws/occurrences/index/download?q=taxon_name%3A%22Alaba%20vibex%22&
##D # fields=latitude,longitude,el874&reasonTypeId=10&sourceTypeId=2001&esc=%5C&sep=%09&file=data
##D 
##D occurrences(taxon="taxon_name:\"Eucalyptus gunnii\"",fields=c("latitude","longitude"),
##D   qa="none",fq="basis_of_record:LivingSpecimen",download_reason_id=10)
##D # equivalent direct webservice call [see this by setting ala_config(verbose=TRUE)]:
##D # http://biocache.ala.org.au/ws/occurrences/index/download?q=taxon_name%3A%22Eucalyptus%20gunnii%22&
##D # fq=basis_of_record%3ALivingSpecimen&fields=latitude,longitude&qa=none&reasonTypeId=10&
##D # sourceTypeId=2001&esc=%5C&sep=%09&file=data
## End(Not run)



