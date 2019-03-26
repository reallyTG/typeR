library(LSD)


### Name: msdplot
### Title: Visualize two-dimensional data clusters
### Aliases: LSD.msdplot msdplot
### Keywords: mean, sd

### ** Examples

at = c(2,4,8,16,32)
clus = matrix(rnorm(500,sd=0.5),ncol=5)
batch = sample(c(-8,-6,-4,-2),100,replace=TRUE)
clus = clus + cbind(0,0.25*batch,0.5*batch,0.75*batch,batch)
clus = clus - clus[,1]
clus = t(t(clus)*c(0,0.1,0.25,0.5,1))
labs = paste("cluster",kmeans(clus,4)$cluster)

colpal = c("darkgreen","darkblue","darkred","black")
msdplot(clus,labs,at,separate=FALSE,col=colpal,alpha=25,xlabels=at)

msdplot(clus,labs,at,col=colpal,alpha=50,xlabels=at)



