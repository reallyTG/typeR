library(sideChannelAttack)


### Name: plot.verify.ho
### Title: plot.verify.ho
### Aliases: plot.verify.ho

### ** Examples

#data collection
data(powerC)
traces = powerC[,-301]
traces = traces[,1:10]
key = powerC[,301]
newIndice = sample(1:256)
traces = traces[newIndice,]
key = key[newIndice]+1

#model checking 
attack=verify.ho(model=gaussian,filter=filter.PCA,Xlearn=traces[1:128,],Ylearn=key[1:128],Xval=traces[129:256,],Yval=key[129:256],nbreVarX=c(2:4))
plot(attack)



