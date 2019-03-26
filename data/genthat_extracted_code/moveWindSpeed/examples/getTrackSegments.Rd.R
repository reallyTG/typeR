library(moveWindSpeed)


### Name: getTrackSegments
### Title: An helper function to extract trajectory segments for wind
###   estimation from a track
### Aliases: getTrackSegments

### ** Examples

length(getTrackSegments(data.frame(1:40,1:40), Sys.time()+1:40))
length(getTrackSegments(data.frame(1:40,1:40), Sys.time()+c(1:25,36:50), windowSize=11))
str(getTrackSegments(data.frame(1:40,1:40), Sys.time()+1:40, windowSize=39))



