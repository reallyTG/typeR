library(interventionalDBN)


### Name: linesROC
### Title: Add an ROC curve to an existing plot.
### Aliases: linesROC
### Keywords: aplot

### ** Examples

trueMatrix<-matrix(rbinom(225,1,0.5),15,15)
pep<-matrix(runif(225,0.2,1)*trueMatrix+runif(225,0,0.5)*(1-trueMatrix),15,15)
plot(0:1, 0:1, t="l", col="grey", xlab="False positive rate",
  ylab="False negative rate", main="An ROC curve.")
linesROC(trueMatrix,pep)



