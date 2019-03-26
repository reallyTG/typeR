library(taxize)


### Name: itis_getrecord
### Title: Get full ITIS record for one or more ITIS TSN's or lsid's.
### Aliases: itis_getrecord

### ** Examples

## Not run: 
##D # by TSN
##D itis_getrecord(202385)
##D itis_getrecord(c(202385,70340))
##D 
##D # by lsid
##D itis_getrecord("urn:lsid:itis.gov:itis_tsn:202385", "lsid")
## End(Not run)



