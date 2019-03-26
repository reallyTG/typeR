library(sideChannelAttack)


### Name: filter.PCA
### Title: filter.PCA
### Aliases: filter.PCA filter.PCA.default predict.filter.PCA

### ** Examples


#data collection
data(powerC)
traces = powerC[,-301]
traces = traces[,1:100]
key = powerC[,301]

#model creation
attack=filter.PCA(X=traces[-1,],nbreVarX_=2)

#model prediction
predict(attack,t(traces[1,]))



