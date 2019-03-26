library(AGSDest)


### Name: cer
### Title: Conditional type I error rate (also called conditional rejection
###   probability)
### Aliases: cer
### Keywords: methods

### ** Examples

##The following calculates the conditional type I error rate
##under the null hypotesis after an adaptation at the second stage
##of the primary trial.
pT=plan.GST(K=4,SF=1,phi=0,alpha=0.025,delta=6,pow=0.8,compute.alab=TRUE,compute.als=TRUE)
cer(pT=pT,iD=list(T=2, z=1.09))



