library(interventionalDBN)


### Name: interventionalDBN-package
### Title: Interventional Inference for Dynamic Bayesian Networks
### Aliases: interventionalDBN-package interventionalDBN
### Keywords: package

### ** Examples

library(interventionalDBN)
data(interventionalData)# loads interventionalData.
# Load your own data spreadsheet using myData<-read.csv("myDataFile.csv").

# Estimate nodes downstream of intervention.
egfriEffects<-interventionEffects(interventionalData,1,"DMSO","EGFRi")
aktiEffects <-interventionEffects(interventionalData,1,"DMSO","AKTi")

# Format the data for network inference
d<-formatData(interventionalData)

# EGFRi is active in conditions 2 and 4, AKTi is active in conditions 3 and 4.
# Each condition has 8 timepoints.
Z<-matrix(0,32,15)
Z[9:16,1]<-1 # EGFR (node 1) is inhibited in condition 2
Z[25:32,1]<-1 # EGFR (node 1) is inhibited in condition 4
Z[17:24,8]<-1 # AKT (node 8) is inhibited in condition 3
Z[25:32,8]<-1 # AKT (node 8) is inhibited in condition 4

# Perform network inference
myNetwork<-interventionalInference(d$y,d$X0,d$X1,Z,max.indeg=3,
  perfectOut=TRUE,fixedEffectOut=TRUE)

# Make ROC curve, to see how well we have done.
data(trueMatrix)
plot(0:1,0:1,t="l",col="grey",xlab="False positive rate",ylab="False negative rate",
  main="ROC curve showing network inference performance.")
redArea<-linesROC(trueMatrix,myNetwork$pep) # ROC area is also sent to the console.

# More realistically, the true edge matrix is unknown.
# We can use descendancy to get (a much coarser) ROC,
# which is based only on nodes that are downstream of the inhibitors.
pap<-warshall(myNetwork$pep)
effectMatrix<-matrix(NA,15,15)
effectMatrix[1,]<-1*(egfriEffects$p.values<=0.1)
effectMatrix[8,]<-1*( aktiEffects$p.values<=0.1)
blueArea<-linesROC(effectMatrix,myNetwork$pep,col="blue")
legend("bottomright",c("Edge matrix known","Descendancy ROC"),col=c("red","blue"),lty=1)



