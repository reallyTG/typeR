library(ndtv)


### Name: msm.sim
### Title: MSM.sim : output of a stergm simulation of basic sex contact
###   network model
### Aliases: msm.sim
### Keywords: datasets

### ** Examples

require(network)
require(networkDynamic)
data(msm.sim)
# show the network, aggregating 5 timesteps
plot(network.extract(msm.sim,onset=0,terminus=5),
  vertex.col=msm.sim%v%"race",vertex.cex=0.5,edge.col="gray")

# this could take 10 minutes, so don't run in example checking
## Not run: 
##D # use ndtv to render a movie of the momentary view of the network
##D render.animation(msm.sim,vertex.col=msm.sim%v%'race',vertex.cex=.5)
##D ani.replay()
##D saveVideo(ani.replay(),video.name="msm.simMomentary.mp4", other.opts="-b 5000k",clean=TRUE)
##D 
##D # another version, this time with more temporal aggregation
##D msm.sim <- compute.animation(msm.sim,slice.par=list(start=0,
##D                                                     end=10,
##D                                                     interval=1,
##D                                                     aggregate.dur=3,
##D                                                     rule='latest'))
##D # also more render more inbetween frames
##D render.animation(msm.sim,render.par = list(tween.frames = 15,show.times=TRUE), 
##D   vertex.col=msm.net%v%'race',vertex.cex=.5)
##D saveVideo(ani.replay(),video.name="msm.sim3Aggregated.mp4", other.opts="-b 5000k",clean=TRUE)
## End(Not run)



