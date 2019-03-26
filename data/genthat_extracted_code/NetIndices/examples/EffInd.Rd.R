library(NetIndices)


### Name: EffInd
### Title: Effective measures (or roles) suite: weighted measures for
###   networks
### Aliases: EffInd
### Keywords: utilities

### ** Examples
# The takapoto atoll network
EffInd(Takapoto, Import = "CO2",
       Export = c("CO2", "Sedimentation", "Grazing"))

# Conesprings is the example set 1a from Latham 2006.
as.data.frame(
  EffInd(Tij = Conesprings, Import = "Inflows",
         Export = c("Export", "Dissipation"))
)



