library(interventionalDBN)


### Name: interventionalInferenceAdvanced
### Title: Dynamic Bayesian Network inference with interventions.
### Aliases: interventionalInferenceAdvanced

### ** Examples

library(interventionalDBN)
data(interventionalData)# loads interventionalData.
# Load your own data spreadsheet using myData<-read.csv("myDataFile.csv").

# Format the data for network inference
d<-formatData(interventionalData)

# Perform network inference without modelling interventions.
myNetwork0<-interventionalInferenceAdvanced(d$y,d$X0,d$X1,max.indeg=3,fittedValues=TRUE)

# EGFRi is active in conditions 2 and 4, AKTi is active in conditions 3 and 4.
myInhibition<-cbind(c(0,1,0,1),c(0,0,1,1))
myInhibitors<-matrix(0,2,15)
myInhibitors[1,1]<-1 # EGFRi targets EGFR (node 1).
myInhibitors[2,8]<-1 # AKTi targets AKT (node 8).

# Perform network inference with perfect and fixed effect interventions.
myNetwork1<-interventionalInferenceAdvanced(d$y,d$X0,d$X1,d$cond,max.indeg=3,
  inhibition=myInhibition,inhibitors=myInhibitors,perfect=TRUE,fixedEffect=TRUE)

# Perform network inference on with mechanism change interventions.
myNetwork2<-interventionalInferenceAdvanced(d$y,d$X0,d$X1,d$cond,max.indeg=3,
  inhibition=myInhibition,inhibitors=myInhibitors,mechanismChange=TRUE)

# Perform network inference with Mukherjee Prior that prefers to omit self-edges.
myNetwork3<-interventionalInferenceAdvanced(d$y,d$X0,d$X1,d$cond,max.indeg=3,
  inhibition=myInhibition,inhibitors=myInhibitors,perfect=TRUE,fixedEffect=TRUE,
  priorType="Mukherjee",priorGraph=matrix(1,15,15)-diag(rep(1,15)),priorStrength=2)
# Compare with self-edge peps with myNetwork1
diag(myNetwork1$pep)-diag(myNetwork3$pep)

# Perform network inference with Hamming Prior that prefers self-edges,
# and use Empirical Bayes to choose the priorStrength.
myNetwork4<-interventionalInferenceAdvanced(d$y,d$X0,d$X1,d$cond,max.indeg=3,
  inhibition=myInhibition,inhibitors=myInhibitors,perfect=TRUE,fixedEffect=TRUE,
  priorType="Hamming",priorGraph=diag(rep(1,15)),priorStrength=0:10/2)
# You should always check to see if the Empirical Bayes appears to be working.
plotMaxML(myNetwork4)

# Now let's try using using the gradients as the response.
# Note that we have to tranfser Sigma this time, as it is no longer the identity.
d<-formatData(interventionalData,gradients=TRUE,initialIntercept=FALSE)

# Perform network inference on gradients with perfect-out interventions.
myNetwork5<-interventionalInferenceAdvanced(d$y,d$X0,d$X1,d$cond,max.indeg=3,
  Sigma=d$Sigma,inhibition=myInhibition,inhibitors=myInhibitors,perfect=TRUE)

# So far we have assumed that the fixed effects are additive in EGFRi+AKTi.
# Now let's change this, by coding EGFRi+AKTi as a separate inhibitor.
d<-formatData(interventionalData)
# EGFRi+AKTi is active in condition 4.
myInhibition<-cbind(c(0,1,0,0),c(0,0,1,0),c(0,0,0,1))
myInhibitors<-matrix(0,3,15)
myInhibitors[1,1]<-1 # EGFRi targets EGFR (node 1).
myInhibitors[2,8]<-1 # AKTi targets AKT (node 8).
myInhibitors[3,c(1,8)]<-1 # EGFRi+AKTi targets both.

# Perform network inference on gradients with fixed effect interventions.
myNetwork7<-interventionalInferenceAdvanced(d$y,d$X0,d$X1,d$cond,max.indeg=3,
  inhibition=myInhibition,inhibitors=myInhibitors,fixedEffect=TRUE)



