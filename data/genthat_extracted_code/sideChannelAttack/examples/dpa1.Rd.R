library(sideChannelAttack)


### Name: dpa1
### Title: DPA
### Aliases: dpa1 predict.dpa1

### ** Examples

#data collection
data(powerC)
traces = powerC[,-301]
key = powerC[,301]+1

#model creation
attack=dpa1(traces[-1,],factor(key[-1]))

#model prediction
predict(attack, traces[1,])



