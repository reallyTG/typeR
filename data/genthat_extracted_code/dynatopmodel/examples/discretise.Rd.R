library(dynatopmodel)


### Name: discretise
### Title: Discrete a catchment into hydrological response units (HRUs)
### Aliases: discretise

### ** Examples

# Landcover and soils are fairly homogenous throughout the Brompton catchment.
# Due to the extensive artifical sybsurface drainage discharging directly into 
# the channel it is hypothesied that the storm response is largely mostly controlled 
# by proximity to the network. A simple discretisation according to flow distance 
# from the nearest channel thus appears to capture the dynamics without introducing
# unnecessary complexity.
## Not run: 
##D require(dynatopmodel)
##D 
##D data(brompton)
##D 
##D chans <- build_chans(brompton$dem, drn=brompton$drn, chan.width=2)
##D sort by distance from the channel network, but want areas closest the channel to come first
##D layers <- addLayer(brompton$dem, 2000-brompton$flowdists)
##D disc <- discretise(layers, cuts=c(flowdists=10), chans=chans, area.thresh=0.5/100)
##D rm(chans)
##D rm(layers)
##D write.table(disc$groups, sep="\t", row.names=FALSE)
## End(Not run)



