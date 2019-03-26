library(PReMiuM)


### Name: calcPredictions
### Title: Calculates the predictions
### Aliases: calcPredictions
### Keywords: predictions

### ** Examples

## Not run: 
##D inputs <- generateSampleDataFile(clusSummaryBernoulliDiscrete())
##D      
##D # prediction profiles
##D preds<-data.frame(matrix(c(0, 0, 1, 0, 0,
##D 0, 0, 1, NA, 0),ncol=5,byrow=TRUE))
##D colnames(preds)<-names(inputs$inputData)[2:(inputs$nCovariates+1)]
##D      
##D # run profile regression
##D runInfoObj<-profRegr(yModel=inputs$yModel, xModel=inputs$xModel, 
##D     nSweeps=100, nBurn=1000, data=inputs$inputData, output="output", 
##D     covNames=inputs$covNames,predict=preds)
##D      
##D # postprocessing
##D dissimObj <- calcDissimilarityMatrix(runInfoObj)
##D clusObj <- calcOptimalClustering(dissimObj)
##D riskProfileObj <- calcAvgRiskAndProfile(clusObj)
##D clusterOrderObj <- plotRiskProfile(riskProfileObj,"summary.png",
##D     whichCovariates=c(1,2))
##D output_predictions <- calcPredictions(riskProfileObj,fullSweepPredictions=TRUE)
##D 
##D # example where the fixed effects can be provided for prediction 
##D # but the observed response is missing 
##D # (there are 2 fixed effects in this example). 
##D # in this example we also use the Rao Blackwellised predictions
##D 
##D inputs <- generateSampleDataFile(clusSummaryPoissonNormal())
##D 
##D # prediction profiles
##D predsPoisson<- data.frame(matrix(c(7, 2.27, -0.66, 1.07, 9, 
##D      -0.01, -0.18, 0.91, 12, -0.09, -1.76, 1.04, 16, 1.55, 1.20, 0.89,
##D      10, -1.35, 0.79, 0.95),ncol=5,byrow=TRUE))
##D colnames(predsPoisson)<-names(inputs$inputData)[2:(inputs$nCovariates+1)]
##D 
##D # run profile regression
##D runInfoObj<-profRegr(yModel=inputs$yModel, 
##D          xModel=inputs$xModel, nSweeps=100, 
##D          nBurn=100, data=inputs$inputData, output="output", 
##D          covNames = inputs$covNames, outcomeT="outcomeT",
##D          fixedEffectsNames = inputs$fixedEffectNames,predict=predsPoisson)
##D 
##D # postprocessing
##D dissimObj<-calcDissimilarityMatrix(runInfoObj)
##D clusObj<-calcOptimalClustering(dissimObj)
##D riskProfileObj<-calcAvgRiskAndProfile(clusObj)
##D output_predictions <- calcPredictions(riskProfileObj,fullSweepPredictions=TRUE)
##D 
##D 
##D # example where both the observed response and fixed effects are present 
##D #(there are no fixed effects in this example, but 
##D # these would just be added as columns between the first and last columns). 
##D 
##D inputs <- generateSampleDataFile(clusSummaryPoissonNormal())
##D 
##D # prediction profiles
##D predsPoisson<- data.frame(matrix(c(NA, 2.27, -0.66, 1.07, NA, 
##D      -0.01, -0.18, 0.91, NA, -0.09, -1.76, 1.04, NA, 1.55, 1.20, 0.89,
##D      NA, -1.35, 0.79, 0.95),ncol=5,byrow=TRUE))
##D colnames(predsPoisson)<-names(inputs$inputData)[2:(inputs$nCovariates+1)]
##D 
##D # run profile regression
##D runInfoObj<-profRegr(yModel=inputs$yModel, 
##D          xModel=inputs$xModel, nSweeps=10, 
##D          nBurn=20, data=inputs$inputData, output="output", 
##D          covNames = inputs$covNames, outcomeT="outcomeT",
##D          fixedEffectsNames = inputs$fixedEffectNames,
##D          nClusInit=15, predict=predsPoisson)
##D 
##D # postprocessing
##D dissimObj<-calcDissimilarityMatrix(runInfoObj)
##D clusObj<-calcOptimalClustering(dissimObj)
##D riskProfileObj<-calcAvgRiskAndProfile(clusObj)
##D output_predictions <- calcPredictions(riskProfileObj,fullSweepPredictions=TRUE)
##D 
## End(Not run)



