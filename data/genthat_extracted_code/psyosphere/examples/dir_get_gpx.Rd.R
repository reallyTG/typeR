library(psyosphere)


### Name: dir_get_gpx
### Title: Read GPX files from directory into data frame.
### Aliases: dir_get_gpx

### ** Examples
## No test: 
gpx_dir <- system.file("extdata", package="psyosphere")
psyo_rounds <- dir_get_gpx(gpx_dir, tz="MET")
## End(No test)


