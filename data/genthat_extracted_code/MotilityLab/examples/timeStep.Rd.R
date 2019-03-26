library(MotilityLab)


### Name: timeStep
### Title: Compute Time Step of Tracks
### Aliases: timeStep

### ** Examples

## Show tracking time fluctuations for the T cell data
d <- timeStep( TCells )
plot( sapply( subtracks( TCells, 1 ) , duration ) - d, ylim=c(-d,d) ) 



