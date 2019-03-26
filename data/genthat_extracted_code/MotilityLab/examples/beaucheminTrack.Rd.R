library(MotilityLab)


### Name: beaucheminTrack
### Title: Simulate a 3D Cell Track Using the Beauchemin Model
### Aliases: beaucheminTrack

### ** Examples

## Create track with model parameters and return matrix of positions
out <- beaucheminTrack(sim.time=20,p.persist = 0.3,taxis.mode = 1)
## Plot X-Y projection
plot( wrapTrack(out) )

## Create 20 tracks and plot them all
out <- simulateTracks( 20, beaucheminTrack(sim.time=10,
  bias.dir=c(-1,1,0),p.bias=10,taxis.mode = 2,
  p.persist = 0.1,delta.t = 1) )
plot( out )



