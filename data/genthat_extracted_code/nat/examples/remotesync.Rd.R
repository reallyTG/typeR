library(nat)


### Name: remotesync
### Title: Synchronise a remote object
### Aliases: remotesync remotesync.neuronlistfh

### ** Examples

## Not run: 
##D kcs20=read.neuronlistfh('http://flybrain.mrc-lmb.cam.ac.uk/si/nblast/flycircuit/kcs20.rds')
##D # update object from the web
##D kcs20=remotesync(kcs20)
##D # download all neurons with significant innervation of the vertical lobe
##D mbvl_neurons=subset(kcs20, (MB_VL_R+MB_VL_L)>200, rval='names')
##D kcs20=remotesync(kcs20, indices=mbvl_neurons, download.missing=TRUE)
## End(Not run)



