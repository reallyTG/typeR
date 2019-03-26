library(NetIndices)


### Name: UncInd
### Title: Network uncertainty indices and constraint effiencies
### Aliases: UncInd
### Keywords: utilities

### ** Examples
# The takapoto atoll network
UncInd(Takapoto, Import = "CO2",
       Export = c("CO2", "Sedimentation", "Grazing"))

# Conesprings is the example set 1a from Latham 2006.
as.data.frame(
   UncInd(Tij = Conesprings, Import = "Inflows",
          Export = c("Export", "Dissipation"))
)



