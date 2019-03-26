library(SQN)


### Name: SQN
### Title: subset quantile normalization
### Aliases: SQN mix.qn SQN.demo.data

### ** Examples

require(mclust)
require(nor1mix)
data(sqnData0)
Ynorm=SQN(sqnData0,ctrl.id=1:1000)  #after normalization
 par(mfrow=c(1,2))
  boxplot(sqnData0,main="before normalization")
  boxplot(sqnData0[1:1000,],add=TRUE,col=3,boxwex=.4)

 boxplot(Ynorm,main="after normalization")
  boxplot(Ynorm[1:1000,],add=TRUE,col=3,boxwex=.4)
  legend(.5,11,legend=c("probes for signal","negative control probes"),text.col=c(1,3),bg="white")




