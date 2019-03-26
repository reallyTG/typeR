library(dalmatian)


### Name: convergence.dalmatian
### Title: Convergence
### Aliases: convergence.dalmatian

### ** Examples


## Load output from previously run model
load(system.file("Pied_Flycatchers_1","pfresults.RData",package="dalmatian"))

## Compute convergence diagnostics
pfconvergence <- convergence(pfresults)




