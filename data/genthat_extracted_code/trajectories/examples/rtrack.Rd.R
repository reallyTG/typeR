library(trajectories)


### Name: rTrack
### Title: Generate random 'Track', 'Tracks' or 'TracksCollection' objects
### Aliases: rTrack rTracks rTracksCollection
### Keywords: random

### ** Examples

x = rTrack()
dim(x)
plot(x)
# x = rTracks(sd1 = 120)
# dim(x)
# plot(as(x, "SpatialLines"), col = 1:dim(x)[1], axes=TRUE)
# x = rTracksCollection() # star
# dim(x)
# plot(x)
x = rTracksCollection(sd2 = 200,p=4,m=10)
plot(x, col=1:dim(x)[1])



