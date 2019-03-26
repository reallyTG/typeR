library(cordillera)


### Name: cordillera
### Title: The OPTICS Cordillera
### Aliases: cordillera
### Keywords: clustering multivariate

### ** Examples

data(iris)
res<-princomp(iris[,1:4])
#2 dim goodness-of-clusteredness with clusters of at least 2 points
#With a matrix of points
cres2<-cordillera(res$scores[,1:2])
cres2
summary(cres2)
plot(cres2)

#with a dist object 
dl0 <- dist(res$scores[,1:2],"maximum") #maximum distance
cres0<-cordillera(dl0)
cres0
summary(cres0)
plot(cres0)

#with any symmetric distance/dissimilarity matrix 
dl1 <- cluster::daisy(res$scores[,1:2],"manhattan") 
cres1<-cordillera(dl1)
cres1
summary(cres1)
plot(cres1)

#4 dim goodness-of-clusteredness with clusters of at least 20
#points for PCA
cres4<-cordillera(res$scores[,1:4],minpts=20,epsilon=13,scale=3) 
#4 dim goodness-of-clusteredness with clusters of at least 20 points for original
#data
cres<-cordillera(iris[,1:4],minpts=20,epsilon=13,dmax=cres4$dmaxe,scale=3)
#There is more clusteredness for the original result
summary(cres4) 
summary(cres) 
plot(cres4) #cluster structure only a bit intelligible
plot(cres) #clearly two well separated clusters

###############################################################################
# Example from Rusch et al. (2017) with original data, PCA and Sammon mapping #
###############################################################################

#data preparation
data(CAClimateIndicatorsCountyMedian)
sovisel <- CAClimateIndicatorsCountyMedian[,-c(1,2,4,9)]
#normalize to [0,1]
sovisel <- apply(sovisel,2,function(x) (x-min(x))/(max(x)-min(x))) 
rownames(sovisel)  <- CAClimateIndicatorsCountyMedian[,1]
dis <- dist(sovisel)

#hyper parameters
dmax=1.22
q=2
minpts=3

#original data directly
cdat <- cordillera(sovisel,distmeth="euclidean",minpts=minpts,epsilon=10,q=q,
                   scale=0)
#equivalently
#dis2=dist(sovisel)
#cdat2 <- cordillera(dis2,minpts=minpts,epsilon=10,q=q,scale=FALSE) 

#PCA in 2-dim
pca1 <- princomp(sovisel)
pcas <- scale(pca1$scores[,1:2])
cpca <- cordillera(pcas,minpts=minpts,epsilon=10,q=q,dmax=dmax,scale=FALSE)

#Sammon mapping in 2-dim
sam <- MASS::sammon(dis)
samp <- scale(sam$points)
csam <- cordillera(samp,epsilon=10,minpts=minpts,q=q,dmax=dmax,scale=FALSE)

#results
cdat
cpca
csam

par(mfrow=c(3,1))
plot(cdat)
plot(cpca)
plot(csam)
par(mfrow=c(1,1))




