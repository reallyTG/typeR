library(ctsem)


### Name: ctExample4
### Title: ctExample4
### Aliases: ctExample4

### ** Examples

## Not run: 
##D Tpoints=20
##D subjects=20
##D full<-c()
##D for(i in 1:20){
##D   LAMBDA<-matrix(c(1,.7,ifelse(i >(subjects/2),.2,1.4)))
##D   print(LAMBDA)
##D   testm<-ctModel(Tpoints=Tpoints,n.latent=1,n.TDpred=0,n.TIpred=0,n.manifest=3,
##D     MANIFESTVAR=diag(.2,3),
##D     # TRAITVAR=diag(.2,1),
##D     LAMBDA=LAMBDA,
##D     DRIFT=matrix(c(-.1),nrow=1,ncol=1),
##D     DIFFUSION=diag(c(.12),1),
##D     MANIFESTMEANS=matrix(c(0,.42,1.3),ncol=1),
##D     CINT=matrix(c(.2),ncol=1))
##D   
##D   testd<-ctGenerate(testm,n.subjects=1,burnin=300)
##D   full<-rbind(full,testd)
##D }
##D 
##D ctExample4<-full
##D save(ctExample4,file=".\\data\\ctExample4.rda") #save wide format example
## End(Not run)



