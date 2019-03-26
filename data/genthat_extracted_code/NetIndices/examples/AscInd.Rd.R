library(NetIndices)


### Name: AscInd
### Title: Ascendency network indices
### Aliases: AscInd
### Keywords: utilities

### ** Examples
# The takapoto atoll network
AscInd(Takapoto, Import = "CO2",
       Export = c("CO2", "Sedimentation", "Grazing"),
       Dissipation = "CO2")
       
# Conesprings is the example set 1a from Latham 2006.
as.data.frame(
    AscInd(Tij = Conesprings, Import = "Inflows",
    Export = c("Export","Dissipation"), 
    Dissipation = "Dissipation")
    )



