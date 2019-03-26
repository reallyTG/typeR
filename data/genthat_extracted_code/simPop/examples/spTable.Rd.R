library(simPop)


### Name: spTable
### Title: Cross tabulations of expected and realized population sizes.
### Aliases: spTable
### Keywords: dplot

### ** Examples


set.seed(1234)  # for reproducibility
data(eusilcS)   # load sample data
samp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize",
  strata="db040", weight="db090")
eusilcP <- simStructure(data=samp, method="direct", basicHHvars=c("age", "rb090"))
res <- spTable(eusilcP, select = c("age", "rb090"))
class(res)
res



