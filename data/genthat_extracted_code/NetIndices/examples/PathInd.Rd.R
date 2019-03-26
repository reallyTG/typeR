library(NetIndices)


### Name: PathInd
### Title: Pathway analysis
### Aliases: PathInd
### Keywords: utilities

### ** Examples
# The takapoto atoll network
PathInd(Takapoto, Import = "CO2",
        Export = c("CO2", "Sedimentation", "Grazing"))

# Conesprings is the example set 1a from Latham 2006.
as.data.frame(
  PathInd(Tij = Conesprings, Import = "Inflows",
          Export = c("Export", "Dissipation"))
)



