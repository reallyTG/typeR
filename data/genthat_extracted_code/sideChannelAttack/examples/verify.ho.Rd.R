library(sideChannelAttack)


### Name: verify.ho
### Title: verify.ho
### Aliases: verify.ho verify.ho.default

### ** Examples

#data collection
data(powerC)
traces = powerC[,-301]
traces = powerC[,1:10]
key = powerC[,301]
newIndice = sample(1:256)
traces = traces[newIndice,]
key = key[newIndice]+1

#model checking
attack=verify.ho(model=gaussian,filter=filter.PCA,Xlearn=traces[1:128,],Ylearn=key[1:128],Xval=traces[128:256,],Yval=key[128:256],nbreVarX=c(3:4))
plot(attack)



