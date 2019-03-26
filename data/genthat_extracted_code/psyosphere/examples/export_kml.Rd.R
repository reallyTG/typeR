library(psyosphere)


### Name: export_kml
### Title: Export tracks as kml files
### Aliases: export_kml

### ** Examples

## Not run: 
##D 
##D # Get tracks
##D 
##D data(psyo)
##D 
##D # Add columns
##D 
##D dir <- tempdir()
##D psyo[,"track_color"] <- "bb00aaff"
##D psyo[,"track_name"] <- psyo[,"id"]
##D psyo[,"file_name"] <- file.path(dir, paste0(psyo[,"track_name"], ".kml"))
##D 
##D # Export files
##D 
##D export_kml(psyo)
## End(Not run)



