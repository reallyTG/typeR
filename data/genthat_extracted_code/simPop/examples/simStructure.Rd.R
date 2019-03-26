library(simPop)


### Name: simStructure
### Title: Simulate the household structure of population data
### Aliases: simStructure
### Keywords: datagen

### ** Examples


data(eusilcS)
inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040", weight="db090")
eusilcP <- simStructure(data=inp, method="direct", basicHHvars=c("age", "rb090"))
class(eusilcP)
eusilcP




