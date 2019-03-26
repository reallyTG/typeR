library(ctsem)


### Name: ctExample2
### Title: ctExample2
### Aliases: ctExample2

### ** Examples

## Not run: 
##D #two process, one time dependent predictor example
##D Tpoints=20
##D manifestNames<-c('LeisureTime','Happiness')
##D TDpredNames<-'MoneyInt'
##D testm<-ctModel(Tpoints=Tpoints,n.latent=3,n.TDpred=1,n.TIpred=0,n.manifest=2,    
##D   LAMBDA=cbind(diag(1,2),0),
##D   MANIFESTVAR=diag(.1,2),
##D   DRIFT=matrix(c(-.3,.12,0,  -.02,-.3,0, 1,-.3,-.0001  ),nrow=3,ncol=3),
##D   TRAITVAR=t(chol(matrix(c(.2,-.1,0,  -.1,.21,0,  0,0,0.00001),ncol=3,nrow=3))),
##D   DIFFUSION=t(chol(diag(c(1.2,.6,0.0001),3))),
##D   CINT=matrix(c(1,.3,0),nrow=3),
##D   T0MEANS=matrix(0,ncol=1,nrow=3),
##D   T0VAR=diag(c(1,1,0),3),
##D   TDPREDEFFECT=matrix(c(.6,.4,1),nrow=3),
##D   TDPREDVAR=diag(c(rep(0,Tpoints)),Tpoints),
##D   TDPREDMEANS=matrix(c(0,0,0,0,0,1,rep(0,Tpoints-6)),ncol=1,nrow=(Tpoints)))
##D testd<-ctGenerate(testm,n.subjects=10,burnin=10) #generate data
##D 
##D ctIndplot(testd,Tpoints=Tpoints,n.manifest=2,n.subjects=10,colourby="variable")
##D 
##D timestokeep=c(0,1,4,5,7,8,16,19)
##D deltaT<-timestokeep[-1] - timestokeep[-8]
##D testd<-testd[,c(paste0('Y',1:2,'_T',rep(timestokeep,each=2)),paste0('TD1_T',timestokeep))]
##D testd<-cbind(testd,matrix(deltaT,nrow=nrow(testd),ncol=length(deltaT),byrow=TRUE))
##D 
##D colnames(testd)<-ctWideNames(n.manifest=2,Tpoints=8,n.TDpred=1,
##D manifestNames=manifestNames,TDpredNames=TDpredNames)
##D ctExample2<-testd
##D save(ctExample2,file=".\\data\\ctExample2.rda") 
## End(Not run)



