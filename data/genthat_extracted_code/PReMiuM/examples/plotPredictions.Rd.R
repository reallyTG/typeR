library(PReMiuM)


### Name: plotPredictions
### Title: Plot the conditional density using the predicted scenarios
### Aliases: plotPredictions
### Keywords: predictions, plots

### ** Examples

## Not run: 
##D # example with Bernoulli outcome and Discrete covariates
##D inputs <- generateSampleDataFile(clusSummaryBernoulliDiscrete())
##D # prediction profiles
##D preds<-data.frame(matrix(c(
##D 2, 2, 2, 2, 2,
##D 0, 0, NA, 0, 0),ncol=5,byrow=TRUE))
##D 
##D colnames(preds)<-names(inputs$inputData)[2:(inputs$nCovariates+1)]
##D # run profile regression
##D runInfoObj<-profRegr(yModel=inputs$yModel, xModel=inputs$xModel, 
##D  nSweeps=10000, nBurn=10000, data=inputs$inputData, output="output", 
##D  covNames=inputs$covNames,predict=preds,
##D  fixedEffectsNames = inputs$fixedEffectNames)        
##D dissimObj <- calcDissimilarityMatrix(runInfoObj)
##D clusObj <- calcOptimalClustering(dissimObj)
##D riskProfileObj <- calcAvgRiskAndProfile(clusObj)
##D predictions <- calcPredictions(riskProfileObj,fullSweepPredictions=TRUE,fullSweepLogOR=TRUE)
##D 
##D plotPredictions(outfile="predictiveDensity.pdf",runInfoObj=runInfoObj,
##D  predictions=predictions,logOR=TRUE)
##D 
## End(Not run)



