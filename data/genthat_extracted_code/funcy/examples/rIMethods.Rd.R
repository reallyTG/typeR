library(funcy)


### Name: rIMethods
### Title: Rand index for cluster configurations of different methods.
### Aliases: rIMethods
### Keywords: Rand index

### ** Examples

set.seed(1234)
ds <- sampleFuncy(obsNr=80, timeNr=20, reg=TRUE, k=4, sd=.4)
res1 <- funcit(methods=1:4, data=Data(ds), k=4, clusters=Cluster(ds))

cls <- Cluster(res1)
rIMethods(methodNames=c("method1","method2","method3","method4"),cls=cls, trueCluster=Cluster(ds))



