library(tidytransit)


### Name: plot.gtfs
### Title: Plot GTFS object routes and their frequencies
### Aliases: plot.gtfs

### ** Examples

## No test: 
local_gtfs_path <- system.file("extdata",
                              "google_transit_nyc_subway.zip",
                              package = "tidytransit")
nyc <- read_gtfs(local_gtfs_path,
                local=TRUE)
plot(nyc)
## End(No test)



