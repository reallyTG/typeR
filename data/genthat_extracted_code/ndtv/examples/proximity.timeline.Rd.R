library(ndtv)


### Name: proximity.timeline
### Title: Plot a chart of a networkDynamic object in which vertices trace
###   out paths in time, positioned vertically so that their proximity
###   corresponds to their relative geodesic distance at the sampled time
###   points.
### Aliases: proximity.timeline

### ** Examples

# use the classroom interaction dataset
data(McFarland_cls33_10_16_96)

# divide the first 20 minutes of time into
# overlapping 2.5 minute bins
# and make the lines for the instructors much larger
proximity.timeline(cls33_10_16_96,
   onsets=seq(0,20,0.5),
   termini=seq(2.5,22.5,0.5),
   vertex.cex=(cls33_10_16_96%v%'type'=='instructor')*4+1,
   labels.at=16)

# load the infection sim dataset
data(toy_epi_sim)
# render a timeline with vertices colored by infection status
# show only the first 5 timesteps
proximity.timeline(toy_epi_sim,vertex.col = 'ndtvcol',
                  spline.style='color.attribute',
                  mode='sammon',default.dist=20,
                  chain.direction='reverse',
                  start=1,end=5)



