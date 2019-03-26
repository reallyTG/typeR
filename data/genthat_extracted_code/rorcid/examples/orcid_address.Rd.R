library(rorcid)


### Name: orcid_address
### Title: Get address information for a person
### Aliases: orcid_address

### ** Examples

## Not run: 
##D # all addresses
##D res <- orcid_address(orcid = "0000-0002-1642-628X")
##D res$`0000-0002-1642-628X`
##D names(res$`0000-0002-1642-628X`)
##D res$`0000-0002-1642-628X`$`address`
##D 
##D # individual address
##D orcid_address(orcid = "0000-0002-1642-628X", 288064)
##D 
##D # format
##D orcid_address(orcid = "0000-0002-1642-628X", 288064, "application/xml")
## End(Not run)



