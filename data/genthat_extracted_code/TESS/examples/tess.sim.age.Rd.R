library(TESS)


### Name: tess.sim.age
### Title: tess.sim.age: Simulate a reconstructed tree for a given age
###   under a global, time-dependent birth-death process.
### Aliases: tess.sim.age
### Keywords: datagen

### ** Examples


l <- function(x) { if (x > 0.5 || x < 0.3) { return (1) } else { return (2) } }
e <- function(x) { if (x > 0.5 || x < 0.3) { return (0.95) } else { return (0.5) } }

tess.sim.age(n=1,age=1,l,e,MRCA=TRUE)

# simulation under constant rates
tess.sim.age(n=1,age=1,2.0,1.0,MRCA=TRUE)




