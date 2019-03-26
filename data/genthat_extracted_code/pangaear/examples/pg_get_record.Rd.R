library(pangaear)


### Name: pg_get_record
### Title: Get record from the Pangaea repository
### Aliases: pg_get_record

### ** Examples

## Not run: 
##D pg_get_record(identifier = "oai:pangaea.de:doi:10.1594/PANGAEA.788382")
##D pg_get_record(identifier = "oai:pangaea.de:doi:10.1594/PANGAEA.269656",
##D prefix="iso19139")
##D pg_get_record(identifier = "oai:pangaea.de:doi:10.1594/PANGAEA.269656",
##D prefix="dif")
##D 
##D # invalid record id
##D # pg_get_record(identifier = "oai:pangaea.de:doi:10.1594/PANGAEA.11111")
##D # pg_get_record(identifier = "oai:pangaea.de:doi:10.1594/PANGAEA.11111",
##D #   prefix="adfadf")
## End(Not run)



