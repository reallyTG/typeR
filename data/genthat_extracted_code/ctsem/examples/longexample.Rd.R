library(ctsem)


### Name: longexample
### Title: longexample
### Aliases: longexample

### ** Examples

## Not run: 
##D #long example (using datastructure base)
##D Tpoints=30
##D testm<-ctModel(Tpoints=Tpoints,n.latent=1,n.TDpred=1,n.TIpred=2,n.manifest=3,    
##D   LAMBDA=matrix(1,ncol=1,nrow=3),
##D   DRIFT=diag(-.3,1),
##D   DIFFUSION=diag(.1,1),
##D   CINT=diag(2,1),
##D   MANIFESTVAR=diag(1,3),
##D   TDPREDEFFECT=diag(.2,1),
##D   TIPREDEFFECT=matrix(.8,nrow=1,ncol=2),
##D   TDPREDVAR=diag(1,1*(Tpoints)),
##D   TIPREDVAR=diag(1,2)
##D )
##D longexample<-round(ctGenerate(testm,n.subjects=2,logdtsd = 1,burnin=3,wide=FALSE)[c(1:3,32:35),],2)
##D longexample[2,c(2,7)]<-NA
##D longexample[4,c(3)]<-NA
##D longexample
##D save(longexample,file='.\\data\\longexample.rda')
## End(Not run)



