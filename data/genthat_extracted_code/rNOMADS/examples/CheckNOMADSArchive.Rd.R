library(rNOMADS)


### Name: CheckNOMADSArchive
### Title: Check to see if archived data exists.
### Aliases: CheckNOMADSArchive
### Keywords: utilities

### ** Examples

#See what is available for January 1 of this year

abbrev <- "gfs4"
model.date <- paste0(format(Sys.time(), "%Y"), "0101")
## Not run: 
##D gfs.available.models <- CheckNOMADSArchive(abbrev, model.date)
## End(Not run)



