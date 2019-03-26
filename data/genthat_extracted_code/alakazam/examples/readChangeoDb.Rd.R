library(alakazam)


### Name: readChangeoDb
### Title: Read a Change-O tab-delimited database file
### Aliases: readChangeoDb

### ** Examples

## Not run: 
##D     # Read all columns in and convert sequence fields to upper case
##D     db <- readChangeoDb("changeo.tsv")
##D 
##D     # Subset columns and convert sequence fields to upper case
##D     db <- readChangeoDb("changeo.tsv", select=c("SEQUENCE_ID", "SEQUENCE_IMGT"))
##D 
##D     # Drop columns and do not alter sequence field case
##D     db <- readChangeoDb("changeo.tsv", drop=c("D_CALL", "DUPCOUNT"), 
##D                         seq_upper=FALSE)
## End(Not run)




