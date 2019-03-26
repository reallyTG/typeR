library(EdSurvey)


### Name: getWeightJkReplicates
### Title: Retrieve the Jackknife Replicate Weights
### Aliases: getWeightJkReplicates

### ** Examples

# read in the example data (generated, not real student data)
sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package="NAEPprimer"))

getWeightJkReplicates(var="origwt", data=sdf)



