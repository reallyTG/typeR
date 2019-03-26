library(performanceEstimation)


### Name: timeseriesWF
### Title: A function implementing sliding and growing window standard
###   workflows for time series forecasting tasks
### Aliases: timeseriesWF
### Keywords: models

### ** Examples


## The following is a small illustrative example using the quotes of the
## SP500 index. This example compares two random forests with 500
## regression trees, one applyed in a standard way, and the other using
## a sliding window with a relearn step of every 10 days. The experiment
## uses 10 repetitions of a train+test cycle using 50% of the available
## data for training and 25% for testing.
## Not run: 
##D library(quantmod)
##D library(randomForest)
##D getSymbols('^GSPC',from='2008-01-01',to='2012-12-31')
##D data.model <- specifyModel(
##D   Next(100*Delt(Ad(GSPC))) ~ Delt(Ad(GSPC),k=1:10)+Delt(Vo(GSPC),k=1:3))
##D data <- as.data.frame(modelData(data.model))
##D colnames(data)[1] <- 'PercVarClose'
##D spExp <- performanceEstimation(
##D   PredTask(PercVarClose ~ .,data,'SP500_2012'),
##D   c(Workflow(wf='standardWF',wfID="standRF",
##D              learner='randomForest',
##D              learner.pars=list(ntree=500)),
##D     Workflow(wf='timeseriesWF',wfID="slideRF",
##D              learner='randomForest',
##D              learner.pars=list(ntree=500),
##D              type="slide",
##D              relearn.step=10)
##D    ),
##D   EstimationTask(
##D      metrics=c("mse","theil"),
##D      method=MonteCarlo(nReps=5,szTrain=0.5,szTest=0.25)
##D      )
##D )
## End(Not run)



