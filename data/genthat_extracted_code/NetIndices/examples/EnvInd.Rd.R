library(NetIndices)


### Name: EnvInd
### Title: Environ network indices
### Aliases: EnvInd
### Keywords: utilities

### ** Examples
# The takapoto atoll network
EnvInd(Takapoto, Import = "CO2",
         Export = c("CO2", "Sedimentation", "Grazing"))

as.data.frame(
  EnvInd(Tij = Conesprings, Import = "Inflows",
         Export = c("Export", "Dissipation"))
)

EnvInd(Tij = Conesprings, Import = "Inflows",
    Export = c("Export", "Dissipation"), full = TRUE)



