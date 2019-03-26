library(AGSDest)


### Name: pvalue
### Title: Calculates the p-value
### Aliases: pvalue
### Keywords: methods

### ** Examples

##The following calculates the repeated p-value of a group sequential trial

## Not run: 
##D GSD=plan.GST(K=4,SF=1,phi=0,alpha=0.025,delta=6,pow=0.8,compute.alab=TRUE,compute.als=TRUE)
##D 
##D GST<-as.GST(GSD=GSD,GSDo=list(T=2, z=3.1))
##D 
##D pvalue(GST,type="r")
##D 
##D ##The stage-wise adjusted p-value of a group sequential trial is calculated by
##D pvalue(GST,type="so")
##D 
##D ##The repeated p-value at the earlier stage T=1 where the trial stopping rule is not met.
##D pvalue(as.GST(GSD,GSDo=list(T=1,z=0.7)),type="r")
##D 
##D ##If the stage-wise adjusted p-value is calculated at this stage,
##D ##the function returns an error message
##D 
##D pvalue(as.GST(GSD,GSDo=list(T=1,z=0.7)),type="so")
##D 
##D ##The repeated and the stage-wise adjusted p-value of a
##D ##group sequential trial after a design adaptation is calculated by
##D 
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
##D pvalue(AGST)
##D 
##D ##The repeated p-value at the earlier stage T=2 where the stopping rule is not met.
##D 
##D pvalue(as.AGST(pT,iD,sT,sTo=list(T=2,z=1.7)),type="r")
##D 
##D ##If the stage-wise adjusted p-value is calculated at this stage,
##D ##the function returns an error message
##D 
##D pvalue(as.AGST(pT,iD,sT,sTo=list(T=2,z=1.7)),type="so")
## End(Not run)



