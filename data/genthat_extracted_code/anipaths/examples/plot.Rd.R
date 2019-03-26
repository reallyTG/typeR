library(anipaths)


### Name: plot.paths_animation
### Title: Plot animation path interpolation
### Aliases: plot.paths_animation

### ** Examples

vultures$POSIX <- as.POSIXct(vultures$timestamp, tz = "UTC")
vultures_paths <- vultures[vultures$POSIX > as.POSIXct("2009-03-22", origin = "1970-01-01") & 
                             vultures$POSIX < as.POSIXct("2009-04-05", origin = "1970-01-01"), ]
interpolated_paths <- 
animate_paths(paths = vultures_paths,
              delta.t = 3600*6,
              coord = c("location.long", "location.lat"),
              Time.name = "POSIX",
              ID.name = "individual.local.identifier", 
              max.knots = 13,
              return.paths = TRUE)
interpolated_paths_gp <- 
animate_paths(paths = vultures_paths,
              delta.t = 3600*6,
              coord = c("location.long", "location.lat"),
              Time.name = "POSIX",
              ID.name = "individual.local.identifier", 
              max.knots = 3*13,
              return.paths = TRUE)
plot(interpolated_paths, i = 2)
plot(interpolated_paths_gp, i = 2, level = 0.01)



