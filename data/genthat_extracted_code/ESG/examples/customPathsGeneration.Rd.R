library(ESG)


### Name: customPathsGeneration
### Title: customPathsGeneration method
### Aliases: customPathsGeneration customPathsGeneration,Scenarios-method

### ** Examples

objScenario  <- new("Scenarios")
# Basic scenario's parameters setting
objScenario  <- setParamsBaseScenarios(objScenario, horizon = 10, nScenarios = 1000)
# Risk factors parameters setting
objScenario  <- setRiskParamsScenariosrt(objScenario, vol = .1, k = 2)
objScenario  <- setRiskParamsScenariosS(objScenario, vol = .1, k = 2, volStock = .2, stock0 = 100, rho=.5)
objScenario  <- setRiskParamsScenariosliqSpr(objScenario, eta=.05, liquiditySpread0=.01)
objScenario  <- setRiskParamsScenariosdefSpr(objScenario, volDefault=.2, defaultSpread0=.01, alpha=.1, beta=1)
# Forward and ZC rates setting
data(ZC)
objScenario  <- setForwardRates(objScenario, ZC, horizon=10)
objScenario  <- setZCRates(objScenario, ZC, horizon=10)
# Projection
objScenario  <- customPathsGeneration(objScenario, type="shortRate")
objScenario  <- customPathsGeneration(objScenario, type="stock")
objScenario  <- customPathsGeneration(objScenario, type="defaultSpread")
objScenario  <- customPathsGeneration(objScenario, type="liquiditySpread")



