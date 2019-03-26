library(interventionalDBN)


### Name: plotMaxML
### Title: Plot the performance of maximum marginal likelihood (Empirical
###   Bayes).
### Aliases: plotMaxML
### Keywords: aplot

### ** Examples

library(interventionalDBN)
data(interventionalData)# loads interventionalData.
# Load your own data spreadsheet using myData<-read.csv("myDataFile.csv").

# Format the data for network inference
d<-formatData(interventionalData)

# EGFRi is active in conditions 2 and 4, AKTi is active in conditions 3 and 4.
# Each condition has 8 timepoints.
Z<-matrix(0,32,15)
Z[9:16,1]<-1 # EGFR (node 1) inhibited in condition 2
Z[25:32,1]<-1 # EGFR inhibited in condition 4
Z[17:24,8]<-1 # AKT (node 8) inhibited in condition 3
Z[25:32,8]<-1 # AKT inhibited in condition 4

# Perform network inference with Hamming Prior that prefers self-edges,
# and use Empirical Bayes to choose the priorStrength.
myNetwork4<-interventionalInference(d$y,d$X0,d$X1,Z,max.indeg=3,
  perfectOut=TRUE,fixedEffectOut=TRUE,
  priorType="Hamming",priorGraph=diag(rep(1,15)),priorStrength=0:10/2)
# You should always check to see if the Empirical Bayes appears to be working.
plotMaxML(myNetwork4)



