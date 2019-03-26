library(dalmatian)


### Name: convergence
### Title: Convergence Diagnostics (S3 Generic)
### Aliases: convergence

### ** Examples


## Load output from previously run model
load(system.file("Pied_Flycatchers_1","pfresults.RData",package="dalmatian"))

## Compute convergence diagnostics
pfconvergence <- convergence(pfresults)




