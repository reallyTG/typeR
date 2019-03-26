library(sideChannelAttack)


### Name: verify.loo
### Title: verify.loo
### Aliases: verify.loo verify.loo.default

### ** Examples

#data collection
data(powerC)
traces = powerC[,-301]
traces = powerC[,1:10]
key = powerC[,301]
newIndice = c(sample(1:128,15),sample(129:256,15))
traces = traces[newIndice,]
key = key[newIndice]+1

#model checking
attack=verify.loo(model=dpa1,filter=filter.PCA,X=traces,Y=key,nbreVarX=c(4:5))
plot(attack)



