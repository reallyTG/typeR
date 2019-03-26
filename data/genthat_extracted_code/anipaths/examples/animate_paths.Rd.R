library(anipaths)


### Name: animate_paths
### Title: animate paths
### Aliases: animate_paths

### ** Examples

##
vultures$POSIX <- as.POSIXct(vultures$timestamp, tz = "UTC")
vultures_paths <- vultures[vultures$POSIX > as.POSIXct("2009-03-01", origin = "1970-01-01") & 
                             vultures$POSIX < as.POSIXct("2009-05-01", origin = "1970-01-01"), ]
animate_paths(paths = vultures_paths,
              delta.t = "week",
              coord = c("location.long", "location.lat"),
              Time.name = "POSIX",
              ID.name = "individual.local.identifier")
## No test: 
readline("Press [enter] to continue.")
background <- list(location = c(-90, 10),
                   zoom = 3,
                   maptype = "satellite")
COVARIATE <- cos(as.numeric(vultures_paths$timestamp) / 
                   diff(range(as.numeric(vultures_paths$timestamp))) * 4 * pi)
animate_paths(paths = cbind(vultures_paths, COVARIATE),
              delta.t = "week",
              coord = c("location.long", "location.lat"),
              Time.name = "POSIX", covariate = "COVARIATE", 
              covariate.colors = RColorBrewer::brewer.pal(n = 9, "RdYlGn"),
              ID.name = "individual.local.identifier", 
              background = background)
## End(No test)



