library(Biocomb)


### Name: compute.auc.random
### Title: Calculates the p-values
### Aliases: compute.auc.random
### Keywords: feature selection classification AUC values

### ** Examples

# example
data(datasetF6)

# class label must be factor
datasetF6[,ncol(datasetF6)]<-as.factor(datasetF6[,ncol(datasetF6)])

auc.val=compute.aucs(dattable=datasetF6)
vauc<-auc.val[,"AUC"]

cors<-"none"
rep.num<-100

pvalues.raw<-compute.auc.random(aucs=vauc,dattable=datasetF6,
 repetitions=rep.num,correction=cors)



