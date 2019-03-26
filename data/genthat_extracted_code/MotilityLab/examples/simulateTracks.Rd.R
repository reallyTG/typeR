library(MotilityLab)


### Name: simulateTracks
### Title: Generate Tracks by Simulation
### Aliases: simulateTracks

### ** Examples

## Generate 10 tracks, 100 steps each, from a random walk with standard normally
## distributed increments and plot them
plot( simulateTracks( 10, brownianTrack(100,3) ) )



