library(TESS)


### Name: tess.sim.taxa.age
### Title: tess.sim.taxa.taxa.age: Simulate a reconstructed tree for a
###   given age and number of taxa under a global, time-dependent
###   birth-death process.
### Aliases: tess.sim.taxa.age
### Keywords: datagen

### ** Examples


l <- function(x) { if (x > 0.5 || x < 0.3) { return (1) } else { return (2) } }
e <- function(x) { if (x > 0.5 || x < 0.3) { return (0.95) } else { return (0.5) } }

tess.sim.taxa.age(n=1,l,e,nTaxa=10,age=1,MRCA=TRUE)

# simulation under constant rates
tess.sim.taxa.age(n=1,2.0,1.0,nTaxa=10,age=1,MRCA=TRUE)




