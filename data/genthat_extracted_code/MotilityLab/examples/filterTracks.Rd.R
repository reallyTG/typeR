library(MotilityLab)


### Name: filterTracks
### Title: Filter Tracks
### Aliases: filterTracks

### ** Examples

## Remove short tracks from the T cells data
plot( filterTracks( function(t) nrow(t)>10, TCells ) )



