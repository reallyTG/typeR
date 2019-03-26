library(sideChannelAttack)


### Name: filter.RegressionTreeFilter
### Title: filter.RegressionTreeFilter
### Aliases: filter.RegressionTreeFilter
###   filter.RegressionTreeFilter.default
###   predict.filter.RegressionTreeFilter

### ** Examples


#data collection
data(powerC)
traces = powerC[,-301]
key = powerC[,301]

#model creation
attack=filter.RegressionTreeFilter(X=traces[-1,],nbreVarX_=2)

#model prediction
predict(attack,t(traces[1,]))



