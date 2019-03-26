library(NetIndices)


### Name: GenInd
### Title: General network indices.
### Aliases: GenInd
### Keywords: utilities

### ** Examples
# The takapoto atoll network
(GI<- GenInd(Takapoto, Import = "CO2",
             Export = c("CO2", "Sedimentation", "Grazing")))
as.data.frame(GI)  

# a simple system
as.data.frame(GenInd(diag(5)))

# Conesprings is the example set 1a from Latham 2006.
as.data.frame(
  GenInd(Tij = Conesprings, Import = "Inflows",
         Export = c("Export", "Dissipation"))
)



