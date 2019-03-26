library(shapeR)


### Name: cluster.plot
### Title: Plot data clusters
### Aliases: cluster.plot

### ** Examples

data(shape)
library(vegan)
cap.res = capscale(getStdWavelet(shape) ~ getMasterlist(shape)$pop)

eig=eigenvals(cap.res,constrained=TRUE)
eig.ratio = eig/sum(eig)

cluster.plot(scores(cap.res)$sites[,1:2],getMasterlist(shape)$pop
,plotCI=TRUE
,xlab=paste("CAP1 (",round(eig.ratio[1]*100,1),"%)",sep="")
,ylab=paste("CAP2 (",round(eig.ratio[2]*100,1),"%)",sep="")
,main="Canonical clustering"
)



