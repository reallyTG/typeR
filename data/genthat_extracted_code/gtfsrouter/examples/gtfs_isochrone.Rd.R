library(gtfsrouter)


### Name: gtfs_isochrone
### Title: gtfs_isochrone
### Aliases: gtfs_isochrone

### ** Examples

berlin_gtfs_to_zip ()
f <- file.path (tempdir (), "vbb.zip")
g <- extract_gtfs (f)
g <- gtfs_timetable (g)
from <- "Alexanderplatz"
start_time <- 12 * 3600 + 600
end_time <- start_time + 600
ic <- gtfs_isochrone (g,
                      from = from,
                      start_time = start_time,
                      end_time = end_time)
## Not run: 
##D plot (ic)
## End(Not run)



