library(sideChannelAttack)


### Name: gaussian
### Title: Template Attack
### Aliases: gaussian 'gaussian. default' predict.gaussian

### ** Examples


#data collection
data(powerC)
traces = powerC[,-301]
traces = traces[,1:100]
key = powerC[,301]+1

#feature selection
filter = filter.PCA(X=traces,nbreVarX_=2)
traces = predict(filter,traces)

#model creation
attack=gaussian(traces[-1,],factor(key[-1]))

#model prediction
predict(attack,traces[1,])



