library(Biocomb)


### Name: pauc
### Title: Calculates the p-values
### Aliases: pauc
### Keywords: feature selection classification AUC values

### ** Examples

# example
data(data_test)

# class label must be factor
data_test[,ncol(data_test)]<-as.factor(data_test[,ncol(data_test)])

auc.val=compute.aucs(dattable=data_test)
vauc<-auc.val[,"AUC"]
val=levels(data_test[,ncol(data_test)])

if(length(val)==2)
{
	 pos=auc.val[,"Positive class"]
	 paucv<-pauc(auc=vauc,labels=data_test[,ncol(data_test)],pos=pos)
}else{
	 num.size=100
	 num.prop=0.5
	 paucv<-pauc(auc=vauc,n=num.size,n.plus=num.prop)
}



