library(MSnID)


### Name: read_mzIDs
### Title: Populates MS/MS results table from mzIdentML files
### Aliases: read_mzIDs

### ** Examples

## Not run: 
##D msnidObj <- MSnID(".")
##D mzids <- system.file("extdata","c_elegans.mzid.gz",package="MSnID")
##D msnidObj <- read_mzIDs(msnidObj, mzids)
##D # clean up the cache directory
##D unlink(".Rcache", recursive=TRUE)
## End(Not run)



