library(trajectories)


### Name: cut
### Title: obtain ranges of space and time coordinates
### Aliases: cut cut.Track cut.Tracks cut.TracksCollection
### Keywords: dplot

### ** Examples

data(storms)
dim(storms)
dim(cut(storms, "week", touches = FALSE)) # same number of geometries
dim(cut(storms, "week")) # increase of geometries = increase of tracks



