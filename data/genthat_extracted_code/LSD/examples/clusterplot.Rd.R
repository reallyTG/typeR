library(LSD)


### Name: clusterplot
### Title: Visualize two-dimensional data clusters
### Aliases: LSD.clusterplot clusterplot
### Keywords: cluster

### ** Examples

samples = 100
probes = 75
at = 1:probes
clus = matrix(rnorm(probes*samples,sd=1),ncol=probes)

clus = rbind(
	t(t(clus)+sin(1:probes/10))+1:nrow(clus)/samples,
	t(t(clus)+sin(pi/2+1:probes/10))+1:nrow(clus)/samples)

quartiles.col = c("transparent","black","transparent")
colpal = c("standardheat","crazyblue","crazyred","crazygreen")

labs = paste("cluster",kmeans(clus,4)$cluster)
clusterplot(clus,fromto=c(0,1))

clusterplot(clus,labs,separate=FALSE,xaxt="n",fromto=c(0.4,0.6),colpal=colpal,
	outer.col="none",ylim=c(-2,3),quartiles.col = quartiles.col)

clusterplot(clus,labs,colpal=colpal)

labs = paste("cluster",kmeans(clus,2)$cluster)
colpal = c("greens","purples")
clusterplot(clus,labs,separate=FALSE,xaxt="n",fromto=c(0.3,0.7),colpal=colpal,
	outer.col="none",ylim=c(-1,2),alpha=50,quartiles.col = quartiles.col)



