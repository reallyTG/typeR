library(sideChannelAttack)


### Name: filter.NULL
### Title: filter.NULL
### Aliases: filter.NULL filter.NULL.default predict.filter.NULL

### ** Examples


#data collection
data(powerC)
traces = powerC[,-301]
key = powerC[,301]

#model creation
attack=filter.NULL()

#model prediction
predict(attack,t(traces[1,]))



