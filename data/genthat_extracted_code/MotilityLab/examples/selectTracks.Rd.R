library(MotilityLab)


### Name: selectTracks
### Title: Select Tracks by Measure Values
### Aliases: selectTracks

### ** Examples

## Slower half of T cells
slow.tcells <- selectTracks( TCells, speed, -Inf, median( sapply(TCells,speed) ) )



