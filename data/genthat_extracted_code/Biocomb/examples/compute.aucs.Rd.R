library(Biocomb)


### Name: compute.aucs
### Title: Ranks the features
### Aliases: compute.aucs
### Keywords: feature selection classification AUC values missing values

### ** Examples

# example for dataset without missing values
data(data_test)

# class label must be factor
data_test[,ncol(data_test)]<-as.factor(data_test[,ncol(data_test)])

out=compute.aucs(dattable=data_test)

# example for dataset with missing values
data(leukemia_miss)
xdata=leukemia_miss

# class label must be factor
xdata[,ncol(xdata)]<-as.factor(xdata[,ncol(xdata)])

# the nominal features must be factors
attrs.nominal=101
xdata[,attrs.nominal]<-as.factor(xdata[,attrs.nominal])

delThre=0.2
out=input_miss(xdata,"mean.value",attrs.nominal,delThre)
if(out$flag.miss)
{
 xdata=out$data
}
xdata=xdata[,-attrs.nominal]
# the nominal features are not processed
out=compute.aucs(dattable=xdata)



