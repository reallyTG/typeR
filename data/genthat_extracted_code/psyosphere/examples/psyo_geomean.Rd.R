library(psyosphere)


### Name: psyo_geomean
### Title: Example data to demonstrate the geomean function
### Aliases: psyo_geomean
### Keywords: datasets

### ** Examples


# Simple example ---------------------------------------------------------------

# Get data frame and compress 4 coordinates
data("psyo_geomean")
compressed_tracks <- average_coordinates(psyo_geomean,
                                                             30,
                                                             "seconds")



