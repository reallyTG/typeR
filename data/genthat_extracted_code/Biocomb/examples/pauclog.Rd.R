library(Biocomb)


### Name: pauclog
### Title: Calculates the p-values
### Aliases: pauclog
### Keywords: feature selection classification AUC values

### ** Examples

# example
data(datasetF6)

# class label must be factor
datasetF6[,ncol(datasetF6)]<-as.factor(datasetF6[,ncol(datasetF6)])

auc.val=compute.aucs(dattable=datasetF6)
vauc<-auc.val[,"AUC"]
val=levels(datasetF6[,ncol(datasetF6)])

if(length(val)==2)
{
	 pos=auc.val[,"Positive class"]
	 paucv<-pauclog(auc=vauc,labels=datasetF6[,ncol(datasetF6)],pos=pos)
}else{
	 num.size=100
	 num.prop=0.5
	 paucv<-pauclog(auc=vauc,n=num.size,n.plus=num.prop)
}



