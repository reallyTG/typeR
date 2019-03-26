library(sideChannelAttack)


### Name: plot.verify.cv
### Title: plot.verify.cv
### Aliases: plot.verify.cv

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
attack=verify.cv(model=dpa1,filter=filter.PCA,X=traces,Y=key,nbreVarX=c(2:4),k=3)
plot(attack)



