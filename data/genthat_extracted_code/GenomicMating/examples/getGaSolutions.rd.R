library(GenomicMating)


### Name: getGaSolutions
### Title: getGaSolutions
### Aliases: getGaSolutions Kmatfunc calculatecrossvalue getstatsM1
###   getstatsM2 getstatsM3 getstatsfromsim pairs3d par.name mapfunct
###   par.position tails

### ** Examples

## Not run: 
##D library(GenomicMating)
##D 
##D ###Create 100 markers for two sets of populations of size 20.
##D N=20
##D nmarkers=100
##D Markers<-c()
##D for (i in 1:N){
##D   Markers<-rbind(Markers,rbinom(nmarkers, 2,.1)-1)
##D }
##D 
##D 
##D Markers2<-c()
##D for (i in 1:N){
##D   Markers2<-rbind(Markers2,rbinom(nmarkers, 2,.1)-1)
##D }
##D 
##D ###Marker effects for a trait.
##D markereffects<-rep(0,nmarkers)
##D markereffects[sample(1:nmarkers,nmarkers/2)]<-rnorm(nmarkers/2)
##D Markers[1:5,1:5]
##D 
##D #######Relationship matrices (K only for the first population.
##D ##K2 for both populations together.)
##D #library(parallel)
##D K=Amat.pieces(rbind(Markers), pieces=5) 
##D 
##D K2=Amat.pieces(rbind(Markers,Markers2), pieces=5) 
##D K[1:5,1:5]
##D 
##D ####putting names
##D rownames(Markers)<-paste("l", 1:nrow(Markers),sep="_")
##D rownames(Markers2)<-paste("l", (nrow(Markers)+1):(nrow(Markers)+
##D nrow(Markers2)),sep="_")
##D rownames(K2)<-colnames(K2)<-c(rownames(Markers),rownames(Markers2))
##D rownames(K)<-colnames(K)<-c(rownames(Markers))
##D 
##D 
##D ###Best genotype in pop 1
##D which.max(Markers%*%markereffects)
##D markermap=as.matrix(data.frame(chr=rep(1,nmarkers),
##D pos=seq(0,1,length=nmarkers)))
##D 
##D colnames(Markers)<-1:nmarkers
##D 
##D ########Mating within pop 1, using method 1. 
##D ########Adjust genetic algorithm paparmeters for convergence.
##D 
##D gasols<-getGaSolutions(Markers=Markers,Markers2=NULL, K=K,
##D markereffects=markereffects,markermap=markermap,nmates=10,
##D minparents=3, impinbreedstepsize=.02, impvar=.01, 
##D impforinbreed=.01,npopGA=50, nitGA=10, miniters=10,minitbefstop=20,
##D plotiters=TRUE,mc.cores=1,nelite=20, mutprob=0.8, noself=TRUE,
##D method=1, type=0L, generation=0L)
##D 
##D gasols
##D 
##D 
##D ######Mating between pop1 and pop2. Method 1.
##D 
##D gasols1<-getGaSolutions(Markers=Markers,Markers2=Markers2, K=K2,
##D markereffects,markermap=markermap,nmates=10,
##D     minparents=3, 
##D     impinbreedstepsize=.02, impvar=.02, 
##D     impforinbreed=.07,
##D     npopGA=50, nitGA=10, miniters=10,minitbefstop=20,
##D     plotiters=TRUE,
##D     mc.cores=2,nelite=20, mutprob=0.8, noself=F, method=1,
##D     type=0L, generation=0L)
##D 
##D 
##D ######Mating between pop1 and pop2. Method 2.
##D 
##D gasols2<-getGaSolutions(Markers=Markers,Markers2=Markers2, K=K2,
##D markereffects,markermap=markermap,nmates=10,
##D     minparents=3, 
##D     impinbreedstepsize=.02, impvar=.02, 
##D     impforinbreed=.07,
##D     npopGA=50, nitGA=10, miniters=10,minitbefstop=20,
##D     plotiters=TRUE,
##D     mc.cores=2,nelite=20, mutprob=0.8, noself=F, method=2,
##D     type=0L, generation=0L)
##D 
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
##D rownames(Markers2)<-paste("l", (nrow(Markers)+1):(nrow(Markers)+nrow(Markers2)),sep="_")
##D rownames(K2)<-colnames(K2)<-c(rownames(Markers),rownames(Markers2))
##D rownames(K)<-colnames(K)<-c(rownames(Markers))
##D 
##D which.max(Markers%*%markereffects)
##D markermap=as.matrix(data.frame(chr=rep(1,nmarkers),pos=seq(0,1,length=nmarkers)))
##D 
##D colnames(Markers)<-1:nmarkers
##D 
##D 
##D gasols3<-getGaSolutions(Markers=Markers,Markers2=Markers2, K=K2,
##D markereffects,markermap=markermap,nmates=10,
##D     minparents=1, 
##D     impinbreedstepsize=.02, impvar=.02, 
##D     impforinbreed=.07,
##D     npopGA=50, nitGA=10, miniters=10,minitbefstop=20,plotiters=TRUE,
##D     mc.cores=1,nelite=20, mutprob=0.8, noself=F, method=3,
##D     type=0L, generation=0L)
##D 
##D 
##D gasols3
##D 
## End(Not run)




