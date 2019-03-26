library(GenomicMating)


### Name: getGaSolutionsFrontierMultiTraitSimcross
### Title: getGaSolutionsFrontierMultiTraitSimcross
### Aliases: getGaSolutionsFrontierMultiTraitSimcross

### ** Examples

	## Not run: 
##D library(GenomicMating)
##D N=10
##D nmarkers=200
##D Markers<-c()
##D for (i in 1:N){
##D   Markers<-rbind(Markers,rbinom(nmarkers, 2,.1)-1)
##D }
##D 
##D Markers2<-c()
##D for (i in 1:N){
##D   Markers2<-rbind(Markers2,rbinom(nmarkers, 2,.1)-1)
##D }
##D 
##D markereffects<-rep(0,nmarkers)
##D markereffects[sample(1:nmarkers,nmarkers/2)]<-rnorm(nmarkers/2)
##D Markers[1:5,1:5]
##D library(parallel)
##D K=Amat.pieces(rbind(Markers), pieces=5) 
##D 
##D K2=Amat.pieces(rbind(Markers,Markers2), pieces=5) 
##D K[1:5,1:5]
##D rownames(Markers)<-paste("l", 1:nrow(Markers),sep="_")
##D rownames(Markers2)<-paste("l", (nrow(Markers)+1):(nrow(Markers)+nrow(Markers2)),sep="_")
##D rownames(K2)<-colnames(K2)<-c(rownames(Markers),rownames(Markers2))
##D rownames(K)<-colnames(K)<-c(rownames(Markers))
##D 
##D markereffects<-rep(0,nmarkers)
##D markereffects[sample(1:nmarkers,nmarkers/2)]<-rnorm(nmarkers/2)
##D markereffects2<-rep(0,nmarkers)
##D markereffects2[sample(1:nmarkers,nmarkers/2)]<-rnorm(nmarkers/2)
##D markereffects3<-rep(0,nmarkers)
##D markereffects3[sample(1:nmarkers,nmarkers/2)]<-rnorm(nmarkers/2)
##D 
##D markermap=as.matrix(data.frame(chr=rep(1,nmarkers),pos=seq(0,1,length=nmarkers)))
##D 
##D map<-cbind(1:nmarkers,1,seq(0,1e+2, length=nmarkers))
##D map<-qtl::sim.map(len=c(.5), n.mar=nmarkers, anchor.tel=TRUE,
##D   include.x=FALSE, sex.sp=FALSE, eq.spacing=FALSE)
##D map<-cbind(1:nmarkers,1,map[[1]])
##D dim(map)
##D 
##D rownames(K)<-colnames(K)<-rownames(Markers)<-1:nrow(Markers)
##D rownames(map)<-1:ncol(Markers)
##D sum(is.na(map))
##D 
##D gasols5<-getGaSolutionsFrontierMultiTraitSimcross(Markers=Markers, 
##D K=K,map=map, markereffectslist=list(markereffects, markereffects2),
##D nmates=10,npopGA=10, nitGA=10,mc.cores=1,mutprob=0.999, 
##D nSim = 10,simtype="riself")
##D 
##D gasols5[[1]]
##D pairs(gasols5[[1]])
## End(Not run)



