library(gtfsrouter)


### Name: summary.gtfs
### Title: summary.gtfs
### Aliases: summary.gtfs

### ** Examples

berlin_gtfs_to_zip ()
f <- file.path (tempdir (), "vbb.zip")
g <- extract_gtfs (f)
summary (g)
g <- gtfs_timetable (g)
summary (g) # also summarizes additional timetable information



