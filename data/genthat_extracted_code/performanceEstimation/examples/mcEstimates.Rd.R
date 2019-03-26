library(performanceEstimation)


### Name: mcEstimates
### Title: Performance estimation for time series prediction tasks using
###   Monte Carlo
### Aliases: mcEstimates
### Keywords: models

### ** Examples


## The following is a small illustrative example using the quotes of the
## SP500 index. This example estimates the performance of a random
## forest on a illustrative example of trying to forecast the future
## variations of the adijusted close prices of the SP500 using a few
## predictors. The random forest is evaluated on 4 repetitions of a
## monte carlo experiment where 30% of the data is used for training
## the model that is then used to make predictions for the next 20%,
## using a sliding window approach with a relearn step of 10 periods
## (check the help page of the timeseriesWF() function to understand
## these and other settings)

## Not run: 
##D library(quantmod)
##D library(randomForest)
##D 
##D getSymbols('^GSPC',from='2008-01-01',to='2012-12-31')
##D data.model <- specifyModel(Next(100*Delt(Ad(GSPC))) ~ Delt(Ad(GSPC),k=1:10)+Delt(Vo(GSPC),k=1:3))
##D data <- as.data.frame(modelData(data.model))
##D colnames(data)[1] <- 'PercVarClose'
##D 
##D spExp <- mcEstimates(Workflow("timeseriesWF",wfID="rfTrial",
##D                               type="slide",relearn.step=10,
##D                               learner='randomForest'),
##D                     PredTask(PercVarClose ~ .,data,"sp500"),
##D                     EstimationTask(metrics=c("mse","theil"),
##D                                    method=MonteCarlo(nReps=4,szTrain=.3,szTest=.2)))
##D 
##D summary(spExp)
## End(Not run)



