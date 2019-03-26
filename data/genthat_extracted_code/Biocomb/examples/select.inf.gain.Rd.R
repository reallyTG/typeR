library(Biocomb)


### Name: select.inf.gain
### Title: Ranks the features
### Aliases: select.inf.gain
### Keywords: feature selection classification information gain missing
###   values

### ** Examples

# example for dataset without missing values
data(data_test)

# class label must be factor
data_test[,ncol(data_test)]<-as.factor(data_test[,ncol(data_test)])
disc<-"equal interval width"
attrs.nominal=numeric()
out=select.inf.gain(data_test,disc.method=disc,attrs.nominal=attrs.nominal)

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
disc<-"equal interval width"
out=select.inf.gain(xdata,disc.method=disc,attrs.nominal=attrs.nominal)



