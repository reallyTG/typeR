library(simPop)


### Name: weighted_estimators
### Title: Weighted mean, variance, covariance matrix and correlation
###   matrix
### Aliases: weighted_estimators meanWt varWt covWt corWt
### Keywords: array multivariate univar

### ** Examples

data(eusilcS)
meanWt(eusilcS$netIncome, weights=eusilcS$rb050)
sqrt(varWt(eusilcS$netIncome, weights=eusilcS$rb050))

# dataObj-methods
inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040", weight="db090")
meanWt(inp, vars="netIncome")
sqrt(varWt(inp, vars="netIncome"))
corWt(inp, vars=c("age", "netIncome"))
covWt(inp, vars=c("age", "netIncome"))



