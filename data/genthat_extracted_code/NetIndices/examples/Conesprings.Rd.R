library(NetIndices)


### Name: Conesprings
### Title: Cone Spring ecosystem.
### Aliases: Conesprings
### Keywords: datasets

### ** Examples

GenInd(Tij = Conesprings, Import = "Inflows",
       Export = c("Export", "Dissipation"))

AscInd(Tij = Conesprings, Import = "Inflows",
       Export = c("Export", "Dissipation"),
       Dissipation = "Dissipation")

UncInd(Tij = Conesprings,Import="Inflows",
       Export = c("Export", "Dissipation"))

EffInd(Tij = Conesprings, Import = "Inflows",
       Export = c("Export", "Dissipation"))

EnvInd(Tij = Conesprings, Import = "Inflows",
       Export = c("Export", "Dissipation"),
       full = TRUE)



