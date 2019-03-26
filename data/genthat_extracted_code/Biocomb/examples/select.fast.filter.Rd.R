library(Biocomb)


### Name: select.fast.filter
### Title: Select the subset of features
### Aliases: select.fast.filter
### Keywords: feature selection classification information gain missing
###   values

### ** Examples

# example for dataset without missing values
data(data_test)

# class label must be factor
data_test[,ncol(data_test)]<-as.factor(data_test[,ncol(data_test)])
disc<-"MDL"
threshold=0.2
attrs.nominal=numeric()
out=select.fast.filter(data_test, disc.method=disc, threshold=threshold,
attrs.nominal=attrs.nominal)

# example for dataset with missing values
data(leukemia_miss)
xdata=leukemia_miss

# class label must be factor
xdata[,ncol(xdata)]<-as.factor(xdata[,ncol(xdata)])

# nominal features must be factors
attrs.nominal=101
xdata[,attrs.nominal]<-as.factor(xdata[,attrs.nominal])

delThre=0.2
out=input_miss(xdata,"mean.value",attrs.nominal,delThre)
if(out$flag.miss)
{
 xdata=out$data
}
disc<-"MDL"
threshold=0.2
out=select.fast.filter(xdata, disc.method=disc, threshold=threshold,
attrs.nominal=attrs.nominal)



