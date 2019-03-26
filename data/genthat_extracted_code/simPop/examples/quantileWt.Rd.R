library(simPop)


### Name: quantileWt
### Title: Weighted sample quantiles
### Aliases: quantileWt
### Keywords: univar

### ** Examples


data(eusilcS)
(quantileWt(eusilcS$netIncome, weights=eusilcS$rb050))

# dataObj-method
inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040", weight="db090")
(quantileWt(inp, vars="netIncome"))




