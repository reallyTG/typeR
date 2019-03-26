library(rorcid)


### Name: as.orcid
### Title: Convert an ORCID or something like an ORCID object
### Aliases: as.orcid

### ** Examples

## Not run: 
##D as.orcid(x="0000-0002-1642-628X")
##D out <- orcid("text:English", rows = 20)
##D as.orcid(out$`orcid-identifier.path`[1])
##D 
##D # Passon further args to orcid_id()
##D as.orcid("0000-0002-1642-628X", verbose = TRUE)
##D 
##D # Browse to a profile
##D # browse(as.orcid("0000-0002-1642-628X"))
##D 
##D # many ORCIDs as a character vector
##D ids <- c("0000-0002-1642-628X", "0000-0002-9341-7985")
##D as.orcid(ids)
##D 
##D # many in a list via orcid_id()
##D (x <- lapply(ids, orcid_id))
##D as.orcid(x)
## End(Not run)



