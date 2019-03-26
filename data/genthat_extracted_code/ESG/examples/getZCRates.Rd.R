library(ESG)


### Name: getZCRates
### Title: getZCRates method
### Aliases: getZCRates getZCRates,Scenarios-method

### ** Examples

scenarios1 <- new("Scenarios")
scenarios1 <- setParamsBaseScenarios(scenarios1, horizon=5, nScenarios=10)
scenarios1 <- setRiskParamsScenarios(scenarios1, vol=.1, k=2,volStock=.2, volRealEstate=.15,volDefault=.2, alpha=.1,beta=1, eta=.05,rho=.5, stock0=100,realEstate0=50, liquiditySpread0=.01, defaultSpread0=.01)
data(ZC)
scenarios1 <- setZCRates(scenarios1, ZC, horizon=5)
getZCRates(scenarios1)



