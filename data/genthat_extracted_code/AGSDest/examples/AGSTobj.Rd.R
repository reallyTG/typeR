library(AGSDest)


### Name: AGSTobj
### Title: Adaptive group sequential trial object (AGSTobj)
### Aliases: AGSTobj plot.AGSTobj print.AGSTobj print.summary.AGSTobj
###   summary.AGSTobj
### Keywords: datasets

### ** Examples

## Not run: 
##D pT=plan.GST(K=3,SF=4,phi=-4,alpha=0.05,delta=6,pow=0.9,compute.alab=TRUE,compute.als=TRUE)
##D 
##D iD=list(T=1, z=1.090728)
##D 
##D swImax=0.0625
##D 
##D I2min=3*swImax
##D I2max=3*swImax
##D 
##D sT=adapt(pT=pT,iD=iD,SF=1,phi=0,cp=0.8,theta=5,I2min,I2max,swImax)
##D 
##D sTo=list(T=2, z=2.393)
##D 
##D AGST<-as.AGST(pT=pT,iD=iD,sT=sT,sTo=sTo)
##D AGST
##D plot(AGST)
##D 
##D AGST<-summary(AGST)
##D plot(AGST)
##D 
##D ##The repeated confidence interval and p-value at an earlier stage
##D ##than the one where the trial stops (T=3).
##D 
##D summary(as.AGST(pT,iD,sT,sTo=list(T=1,z=1.7)),ctype="r",ptype="r")
##D 
##D ##If the stage-wise adjusted confidence interval is calculated at this stage,
##D ##the function returns an error message
##D summary(as.AGST(pT,iD,sT,sTo=list(T=1,z=1.7)),ctype="so",ptype="so")
## End(Not run)



