library(NeatMap)


### Name: nMDS
### Title: non-Metric Multi-Dimensional Scaling
### Aliases: nMDS
### Keywords: multivariate nonparametric

### ** Examples

#Two dimensional embedding
mtcars.nMDS<-nMDS(as.matrix(mtcars),embed.dim=2,metric="euclidean")
plot(mtcars.nMDS$x,type='n')
text(mtcars.nMDS$x,labels=rownames(mtcars.nMDS$x))



