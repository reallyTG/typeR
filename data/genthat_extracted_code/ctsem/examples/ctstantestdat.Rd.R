library(ctsem)


### Name: ctstantestdat
### Title: ctstantestdat
### Aliases: ctstantestdat

### ** Examples

## Not run: 
##D Tpoints=20
##D n.manifest=2
##D n.TDpred=1
##D n.TIpred=3
##D n.latent=2
##D n.subjects=5
##D gm<-ctModel(type='omx', Tpoints=Tpoints,n.latent=n.latent,
##D n.TDpred=n.TDpred,n.TIpred=n.TIpred,n.manifest=n.manifest,
##D   MANIFESTVAR=diag(0.5,2),
##D   TIPREDEFFECT=matrix(c(.5,0,0,-.7,0,2),nrow=2),
##D   TIPREDVAR=matrix(c(1,-.2,0, 0,1,0, 0,0,.5),nrow=3),
##D   TDPREDVAR=matrix(0,nrow=n.TDpred*(Tpoints),ncol=n.TDpred*(Tpoints)),
##D   TDPREDMEANS=matrix(round(exp(rnorm(n.TDpred*(Tpoints),-1.9,1)),0),
##D    nrow=n.TDpred*(Tpoints)),
##D    TDPREDEFFECT = matrix(c(1,-1),ncol=1),
##D   LAMBDA=diag(1,2),
##D   DRIFT=matrix(c(-.3,.2,0,-.2),nrow=2),
##D   DIFFUSION=matrix(c(2,1,0,2),2),
##D   CINT=matrix(c(0,0),nrow=2),
##D   T0MEANS=matrix(0,ncol=1,nrow=2),
##D   T0VAR=diag(100,2))
##D 
##D ctstantestdat<-ctGenerate(gm,n.subjects=n.subjects,burnin=30,
##D wide=FALSE,logdtsd=.4)
##D 
##D ctstantestdat[2,'Y1'] <- NA
##D ctstantestdat[ctstantestdat[,'id']==2,'TI1'] <- NA
##D ctstantestdat[2,'TD1'] <- NA
##D 
##D save(ctstantestdat,file='.\\data\\ctstantestdat.rda')
## End(Not run)



