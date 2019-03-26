library(GenomicMating)


### Name: getGaSolutionsFrontier
### Title: getGaSolutionsFrontier
### Aliases: getGaSolutionsFrontier

### ** Examples

	## Not run: 
##D library(GenomicMating)
##D #############
##D ####for method 3 polyploid. Markers need to be coded between 0 and 1.
##D N=20
##D nmarkers=100
##D Markers<-c()
##D for (i in 1:N){
##D   Markers<-rbind(Markers,runif(nmarkers))
##D }
##D 
##D 
##D Markers2<-c()
##D for (i in 1:N){
##D   Markers2<-rbind(Markers2,runif(nmarkers))
##D }
##D 
##D markereffects<-rep(0,nmarkers)
##D markereffects[sample(1:nmarkers,nmarkers/2)]<-rnorm(nmarkers/2)
##D Markers[1:5,1:5]
##D #library(parallel)
##D K=Amat.pieces(rbind(Markers)*2-1, pieces=5) 
##D 
##D K2=Amat.pieces(rbind(Markers,Markers2)*2-1, pieces=5) 
##D K[1:5,1:5]
##D rownames(Markers)<-paste("l", 1:nrow(Markers),sep="_")
##D rownames(Markers2)<-paste("l", (nrow(Markers)+1):(nrow(Markers)+
##D nrow(Markers2)),sep="_")
##D rownames(K2)<-colnames(K2)<-c(rownames(Markers),rownames(Markers2))
##D rownames(K)<-colnames(K)<-c(rownames(Markers))
##D 
##D which.max(Markers%*%markereffects)
##D markermap=as.matrix(data.frame(chr=rep(1,nmarkers),
##D pos=seq(0,1,length=nmarkers)))
##D 
##D colnames(Markers)<-1:nmarkers
##D 
##D 
##D gasols4<-getGaSolutionsFrontier(Markers=Markers,Markers2=Markers2, K=K2,
##D markereffects,markermap=markermap,nmates=10,npopGA=100, nitGA=100,
##D mc.cores=1, mutprob=0.999, noself= TRUE, method=3,
##D type=2L, generation=1L, plotiters= TRUE)
##D 
##D 
##D 
##D ###plot results
##D 
##D pairs(gasols4[[1]])
##D 
##D ####Use plotGM.
##D 
##D plotGM(GMsols=gasols4, type="3D", traitnum=1)
##D plotGM(GMsols=gasols4, type="SOM", traitnum=1)
##D 
##D 
## End(Not run)



