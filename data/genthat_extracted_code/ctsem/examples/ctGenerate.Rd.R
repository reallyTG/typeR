library(ctsem)


### Name: ctGenerate
### Title: ctGenerate
### Aliases: ctGenerate

### ** Examples

#generate data for 2 process model, each process measured by noisy indicator, 
#stable individual differences in process levels.

generatingModel<-ctModel(Tpoints=8,n.latent=2,n.TDpred=0,n.TIpred=0,n.manifest=2,
 MANIFESTVAR=diag(.1,2),
 LAMBDA=diag(1,2),
 DRIFT=matrix(c(-.2,-.05,-.1,-.1),nrow=2),
 TRAITVAR=matrix(c(.5,.2,0,.8),nrow=2),
 DIFFUSION=matrix(c(1,.2,0,4),2),
 CINT=matrix(c(1,0),nrow=2),
 T0MEANS=matrix(0,ncol=1,nrow=2),
 T0VAR=diag(1,2))

data<-ctGenerate(generatingModel,n.subjects=15,burnin=10)



