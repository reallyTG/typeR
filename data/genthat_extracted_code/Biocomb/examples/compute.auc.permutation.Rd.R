library(Biocomb)


### Name: compute.auc.permutation
### Title: Calculates the p-values
### Aliases: compute.auc.permutation
### Keywords: feature selection classification AUC values

### ** Examples

# example
data(data_test)

# class label must be factor
data_test[,ncol(data_test)]<-as.factor(data_test[,ncol(data_test)])

auc.val=compute.aucs(dattable=data_test)
vauc<-auc.val[,"AUC"]
rep.num<-20

p.values=compute.auc.permutation(aucs=vauc,dattable=data_test,rep.num)



