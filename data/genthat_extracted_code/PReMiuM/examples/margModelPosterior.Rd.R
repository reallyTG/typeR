library(PReMiuM)


### Name: margModelPosterior
### Title: Marginal Model Posterior
### Aliases: margModelPosterior
### Keywords: margModelPosterior

### ** Examples

inputs <- generateSampleDataFile(clusSummaryBernoulliDiscrete())

runInfoObj<-profRegr(yModel=inputs$yModel, 
         xModel=inputs$xModel, nSweeps=5, 
         nBurn=10, data=inputs$inputData, output="output", 
         covNames = inputs$covNames, nClusInit=15,
         fixedEffectsNames = inputs$fixedEffectNames)

margModelPost<-margModelPosterior(runInfoObj)




