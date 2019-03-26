library(bclust)


### Name: bclust
### Title: Bayesian agglomerative clustering for high dimensional data with
###   variable selection.
### Aliases: bclust

### ** Examples

data(gaelle)

# unreplicated clustering
gaelle.bclust<-bclust(x=gaelle,
transformed.par=c(-1.84,-0.99,1.63,0.08,-0.16,-1.68)) 
par(mfrow=c(2,1))
plot(as.dendrogram(gaelle.bclust))
abline(h=gaelle.bclust$cut)
plot(gaelle.bclust$clust.number,gaelle.bclust$logposterior,
xlab="Number of clusters",ylab="Log posterior",type="b")
abline(h=max(gaelle.bclust$logposterior))

#replicated clustering
gaelle.id<-rep(1:14,c(3,rep(4,13))) 
# first 3 rows replication of ColWT 
# 4 replications for the others

gaelle.lab<-c("ColWT","d172","d263","isa2",
"sex4","dpe2","mex1","sex3","pgm","sex1",
"WsWT","tpt","RLDWT","ke103")

gaelle.bclust<-bclust(gaelle,rep.id=gaelle.id,labels=gaelle.lab,
transformed.par=c(-1.84,-0.99,1.63,0.08,-0.16,-1.68))
plot(as.dendrogram(gaelle.bclust))
abline(h=gaelle.bclust$cut)
plot(gaelle.bclust$clust.number,gaelle.bclust$logposterior,
xlab="Number of clusters",ylab="Log posterior",type="b")
abline(h=max(gaelle.bclust$logposterior))



