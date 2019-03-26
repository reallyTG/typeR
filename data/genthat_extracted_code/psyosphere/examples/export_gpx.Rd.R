library(psyosphere)


### Name: export_gpx
### Title: Export tracks as gpx files
### Aliases: export_gpx
### Keywords: ~kwd1 ~kwd2

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
##D psyo[,"track_name"] <- psyo[,"id"]
##D psyo[,"file_name"] <- file.path(dir, psyo[,"track_name"])
##D 
##D # Export files
##D 
##D export_gpx(tracks = psyo)
## End(Not run)



