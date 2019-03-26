library(sideChannelAttack)


### Name: filter.mRMR
### Title: filter.mRMR
### Aliases: filter.mRMR filter.mRMR.default predict.filter.mRMR

### ** Examples


#data collection
data(powerC)
traces = powerC[,-301]
key = powerC[,301]

#model creation
attack=filter.mRMR(X=traces[-1,1:10],Y=key[-1],nbreVarX_=2)

#model prediction
predict(attack,t(traces[1,]))



