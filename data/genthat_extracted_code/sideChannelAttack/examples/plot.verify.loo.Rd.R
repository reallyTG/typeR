library(sideChannelAttack)


### Name: plot.verify.loo
### Title: plot.verify.loo
### Aliases: plot.verify.loo

### ** Examples

#data collection
data(powerC)
traces = powerC[,-301]
traces = traces[,1:10]
key = powerC[,301]
newIndice = c(sample(1:128,15),sample(129:256,15))
traces = traces[newIndice,]
key = key[newIndice]+1

#model checking
attack=verify.loo(model=dpa1,filter=filter.mRMR,X=traces,Y=key,nbreVarX=c(2:3))
plot(attack)



