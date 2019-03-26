library(sideChannelAttack)


### Name: filter.MAX
### Title: filter.MAX
### Aliases: filter.MAX filter.MAX.default predict.filter.MAX

### ** Examples


#data collection
data(powerC)
traces = powerC[,-301]
key = powerC[,301]

#model creation
attack=filter.MAX(nbreVarX_=2)

#model prediction
predict(attack,t(traces[1,]))



