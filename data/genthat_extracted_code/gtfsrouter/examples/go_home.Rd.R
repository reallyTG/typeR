library(gtfsrouter)


### Name: go_home
### Title: go_home
### Aliases: go_home

### ** Examples

## Not run: 
##D # For general use, please set these three variables:
##D Sys.setenv ("gtfs_home" = "<my home station>")
##D Sys.setenv ("gtfs_work" = "<my work station>")
##D Sys.setenv ("gtfs_data" = "/full/path/to/gtfs.zip")
## End(Not run)
# The following illustrate use with sample data bundled with package
Sys.setenv ("gtfs_home" = "Tempelhof")
Sys.setenv ("gtfs_work" = "Alexanderplatz")
Sys.setenv ("gtfs_data" = file.path (tempdir (), "vbb.zip"))
process_gtfs_local () # If not already done
go_home (start_time = "12:00") # next available service after 12:00
go_home (3, start_time = "12:00") # Wait until third service after that
# Generally, `start_time` will not be specified, in which case `go_home` will
# return next available service from current system time, so calls will
# generally be as simple as:
## Not run: 
##D go_home ()
##D go_home (3)
## End(Not run)



