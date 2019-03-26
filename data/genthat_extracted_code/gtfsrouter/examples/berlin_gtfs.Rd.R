library(gtfsrouter)


### Name: berlin_gtfs
### Title: berlin_gtfs
### Aliases: berlin_gtfs
### Keywords: datasets

### ** Examples

berlin_gtfs_to_zip () # Write sample feed from Berlin, Germany to tempdir
f <- file.path (tempdir (), "vbb.zip") # name of feed
gtfs <- extract_gtfs (f)
from <- "Innsbrucker Platz" # U-bahn station, not "S"
to <- "Alexanderplatz"
start_time <- 12 * 3600 + 120 # 12:02
route <- gtfs_route (gtfs, from = from, to = to, start_time = start_time)

# Specify day of week
route <- gtfs_route (gtfs, from = from, to = to, start_time = start_time,
                     day = "Sunday")

# specify travel by "U" = underground only
route <- gtfs_route (gtfs, from = from, to = to, start_time = start_time,
                     day = "Sunday", route_pattern = "^U")
# specify travel by "S" = street-level only (not underground)
route <- gtfs_route (gtfs, from = from, to = to, start_time = start_time,
                     day = "Sunday", route_pattern = "^S")

# Route queries are generally faster if the GTFS data are pre-processed with
# `gtfs_timetable()`:
gt <- gtfs_timetable (gtfs, day = "Sunday", route_pattern = "^S")
route <- gtfs_route (gt, from = from, to = to, start_time = start_time)




