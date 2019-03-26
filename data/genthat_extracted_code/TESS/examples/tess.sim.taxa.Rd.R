library(TESS)


### Name: tess.sim.taxa
### Title: tess.sim.taxa.taxa: Simulate a reconstructed tree for a given
###   number of taxa under a global, time-dependent birth-death process.
### Aliases: tess.sim.taxa
### Keywords: datagen

### ** Examples


l <- function(x) { if (x > 0.5 || x < 0.3) { return (1) } else { return (2) } }
e <- function(x) { if (x > 0.5 || x < 0.3) { return (0.95) } else { return (0.5) } }

tess.sim.taxa(n=1,nTaxa=10,max=10,l,e,MRCA=TRUE)

# simulation under constant rates
tess.sim.taxa(n=1,nTaxa=10,max=10,2.0,1.0,MRCA=TRUE)




