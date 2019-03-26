library(tsna)


### Name: timeProjectedNetwork
### Title: Construct a time-projected ("multi-slice") network by binning a
###   networkDynamic object
### Aliases: timeProjectedNetwork

### ** Examples

data(moodyContactSim)


# use slices at each changing time point
library(networkDynamicData)
data(vanDeBunt_students)
times<-get.change.times(vanDeBunt_students)
vanDProj<-timeProjectedNetwork(vanDeBunt_students,onsets = times,termini = times)
# plot it with gray for the time edges
plot(vanDProj,
    arrowhead.cex = 0,
     edge.col=ifelse(vanDProj%e%'edge.type'=='within_slice','black','gray'),
     vertex.cex=0.7,mode='kamadakawai')
## Not run: 
##D 
##D # compute shortest temporal path distances from each vertex in first slice
##D # to each vertex in last slice
##D library(sna)
##D geodist(vanDProj)$gdist[1:32,193:224]
##D 
##D # bin the moody sim into 100 timestep chunks
##D # (this will over-represent some transmission potential)
##D moodyProj<-timeProjectedNetwork(moodyContactSim,time.increment=100)
##D plot(moodyProj,arrowhead.cex = 0,
##D     edge.col=ifelse(moodyProj%e%'edge.type'=='within_slice','black','gray'),
##D     vertex.cex=0.7,displaylabels = TRUE,label.cex=0.6)
## End(Not run)    
    



