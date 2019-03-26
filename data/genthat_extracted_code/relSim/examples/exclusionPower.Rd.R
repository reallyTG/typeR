library(relSim)


### Name: exclusionPower
### Title: Calculate the exclusion power of a multiplex by locus
### Aliases: exclusionPower ep

### ** Examples


data(USCaucs)
ep(USCaucs)

## get the multiplex wide exclusion power
1 - prod(1-ep(USCaucs))




