library(taxize)


### Name: itis_lsid
### Title: Get TSN from LSID
### Aliases: itis_lsid

### ** Examples

## Not run: 
##D # Get TSN
##D itis_lsid("urn:lsid:itis.gov:itis_tsn:180543")
##D itis_lsid(lsid=c("urn:lsid:itis.gov:itis_tsn:180543","urn:lsid:itis.gov:itis_tsn:28726"))
##D 
##D # Get partial record
##D itis_lsid("urn:lsid:itis.gov:itis_tsn:180543", "record")
##D 
##D # Get full record
##D itis_lsid("urn:lsid:itis.gov:itis_tsn:180543", "fullrecord")
##D 
##D # An invalid lsid (a tsn actually)
##D itis_lsid(202385)
## End(Not run)



