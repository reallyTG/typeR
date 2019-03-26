library(scrobbler)


### Name: convert
### Title: convert
### Aliases: convert

### ** Examples

unix_time <- "1522124746"
timestamp <- convert(unix_time, to = "Time")


my_tracks <- read_scrobbles(system.file("extdata", "scrobbles.txt", package = "scrobbler"))
my_tracks$Date <- convert(my_tracks$Date, to = "Time")



