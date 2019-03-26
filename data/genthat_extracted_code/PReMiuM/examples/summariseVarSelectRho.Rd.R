library(PReMiuM)


### Name: summariseVarSelectRho
### Title: summariseVarSelectRho
### Aliases: summariseVarSelectRho
### Keywords: variableSelection

### ** Examples


inputs <- generateSampleDataFile(clusSummaryVarSelectBernoulliDiscrete())

runInfoObj<-profRegr(yModel=inputs$yModel, 
    xModel=inputs$xModel, nSweeps=10, nClusInit=15, 
    nBurn=20, data=inputs$inputData, output="output", 
    covNames = inputs$covNames, varSelect="Continuous")

rho<-summariseVarSelectRho(runInfoObj)



