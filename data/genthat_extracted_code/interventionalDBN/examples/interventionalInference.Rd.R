library(interventionalDBN)


### Name: interventionalInference
### Title: Dynamic Bayesian Network inference with interventions.
### Aliases: interventionalInference

### ** Examples

library(interventionalDBN)
data(interventionalData)# loads interventionalData.
# Load your own data spreadsheet using myData<-read.csv("myDataFile.csv").

# Format the data for network inference
d<-formatData(interventionalData)

# Perform network inference without modelling interventions.
myNetwork0<-interventionalInference(d$y,d$X0,d$X1,max.indeg=3,fittedValues=TRUE)

# EGFRi is active in conditions 2 and 4, AKTi is active in conditions 3 and 4.
# Each condition has 8 timepoints.
Z<-matrix(0,32,15)
Z[9:16,1]<-1 # EGFR (node 1) is inhibited in condition 2
Z[25:32,1]<-1 # EGFR (node 1) is inhibited in condition 4
Z[17:24,8]<-1 # AKT (node 8) is inhibited in condition 3
Z[25:32,8]<-1 # AKT (node 8) is inhibited in condition 4

# Perform network inference with perfect-out and fixed-effect-out interventions.
myNetwork1<-interventionalInference(d$y,d$X0,d$X1,Z,max.indeg=3,
  perfectOut=TRUE,fixedEffectOut=TRUE)

# Perform network inference on with mechanism-change-out interventions.
myNetwork2<-interventionalInference(d$y,d$X0,d$X1,Z,max.indeg=3,
  mechanismChangeOut=TRUE)

# Perform network inference with Mukherjee Prior that prefers to omit self-edges.
myNetwork3<-interventionalInference(d$y,d$X0,d$X1,Z,max.indeg=3,
  perfectOut=TRUE,fixedEffectOut=TRUE,
  priorType="Mukherjee",priorGraph=matrix(1,15,15)-diag(rep(1,15)),priorStrength=2)
# Compare with self-edge peps with myNetwork1
diag(myNetwork1$pep)-diag(myNetwork3$pep)

# Perform network inference with Hamming Prior that prefers self-edges,
# and use Empirical Bayes to choose the priorStrength.
myNetwork4<-interventionalInference(d$y,d$X0,d$X1,Z,max.indeg=3,
  perfectOut=TRUE,fixedEffectOut=TRUE,
  priorType="Hamming",priorGraph=diag(rep(1,15)),priorStrength=0:10/2)
# You should always check to see if the Empirical Bayes appears to be working.
plotMaxML(myNetwork4)

# Now let's try using using the gradients as the response.
# Note that we have to tranfser Sigma this time, as it is no longer the identity.
d<-formatData(interventionalData,gradients=TRUE,initialIntercept=FALSE)
# There are now only 28 observations
Z<-Z[c(2:8,10:16,18:24,26:32),]

# Perform network inference on gradients with perfect-in interventions.
myNetwork5<-interventionalInference(d$y,d$X0,d$X1,Z,max.indeg=3,
  Sigma=d$Sigma,perfectIn=TRUE,fittedValues=TRUE)
  
# Perform network inference on gradients with perfect-in and -out plus fixed-effect out.
myNetwork6<-interventionalInference(d$y,d$X0,d$X1,Z,max.indeg=3,
  Sigma=d$Sigma,perfectIn=TRUE,perfectOut=TRUE)



