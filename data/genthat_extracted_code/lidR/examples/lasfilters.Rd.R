library(lidR)


### Name: lasfilters
### Title: Predefined filters
### Aliases: lasfilters lasfilterfirst lasfilterfirstlast
###   lasfilterfirstofmany lasfilterground lasfilterlast lasfilternth
###   lasfiltersingle

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
lidar = readLAS(LASfile)

firstReturns  = lasfilterfirst(lidar)
groundReturns = lasfilterground(lidar)



