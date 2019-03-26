library(QuantumClone)


### Name: Precision_Recall
### Title: Precision
### Aliases: Precision_Recall

### ** Examples

set.seed(123)
#1: Cluster data
FQC<-FlashQC(QuantumClone::Input_Example,conta = c(0,0),Nclus = 2:10)

#2: Compute NMI
Precision_Recall(hx = FQC$cluster,Truth = QuantumClone::Input_Example[[1]]$Chr)

### From Stanford NLP example:
cluster<-c(rep(1,6),rep(2,6),rep(3,5))
truth<-c(rep(1,5),2,
         1,rep(2,4),3,
         rep(1,2),rep(3,3))
Precision_Recall(cluster,truth)



