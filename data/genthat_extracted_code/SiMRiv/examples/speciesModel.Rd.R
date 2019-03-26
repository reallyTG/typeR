library(SiMRiv)


### Name: speciesModel
### Title: Defines a species model to adjust to a real trajectory
### Aliases: speciesModel

### ** Examples

library(SiMRiv)

model <- speciesModel("RW.CRW.sl")

# this shows the parameters that will be approximated
model

# this creates a species with 2 states
# RW and a CRW with correlation 0.9
# with the switching probabilities RW->CRW = 0.01, CRW->RW = 0.05
# and the step lengths RW = 15, CRW = 50.

species <- model(c(0.9, 0.01, 0.05, 15, 50))



