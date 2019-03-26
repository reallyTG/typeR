library(GenomicMating)


### Name: getGaSolutionsFrontierMultiTrait
### Title: getGaSolutionsFrontierMultiTrait
### Aliases: getGaSolutionsFrontierMultiTrait

### ** Examples

	## Not run: 
##D library("GenomicMating")
##D 
##D N=10
##D 
##D nmarkers=200
##D Markers<-c()
##D for (i in 1:N){
##D Markers<-rbind(Markers,rbinom(nmarkers, 2,.1)-1)
##D }
##D 
##D Markers2<-c()
##D for (i in 1:N){
##D Markers2<-rbind(Markers2,rbinom(nmarkers, 2,.1)-1)
##D }
##D 
##D markereffects<-rep(0,nmarkers)
##D 
##D markereffects[sample(1:nmarkers,nmarkers/2)]<-rnorm(nmarkers/2)
##D 
##D Markers[1:5,1:5]
##D 
##D K=Amat.pieces(rbind(Markers), pieces=5) 
##D K2=Amat.pieces(rbind(Markers,Markers2), pieces=5) 
##D 
##D rownames(Markers)<-paste("l", 1:nrow(Markers),sep="_")
##D rownames(Markers2)<-paste("l", (nrow(Markers)+1):(nrow(Markers)+nrow(Markers2)),sep="_")
##D 
##D rownames(K2)<-colnames(K2)<-c(rownames(Markers),rownames(Markers2))
##D rownames(K)<-colnames(K)<-c(rownames(Markers))
##D 
##D #######Two sets of marker effects
##D 
##D markereffects<-rep(0,nmarkers)
##D markereffects[sample(1:nmarkers,nmarkers/2)]<-rnorm(nmarkers/2)
##D markereffects2<-rep(0,nmarkers)
##D markereffects2[sample(1:nmarkers,nmarkers/2)]<-rnorm(nmarkers/2)
##D 
##D 
##D gasols4<-getGaSolutionsFrontierMultiTrait(Markers=Markers,
##D Markers2=Markers2,K=K2,
##D markereffectslist=list(markereffects,markereffects2),
##D markermap=markermap,nmates=20,npopGA=100, nitGA=10, 
##D mc.cores=1, mutprob=0.99,method=2,
##D type=0, generation=3, plotiters= TRUE)
##D 
##D str(gasols4)
##D gasols4[[1]][1:5,]
## End(Not run)



