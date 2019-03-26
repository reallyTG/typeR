library(Biocomb)


### Name: select.process
### Title: Feature ranking and feature selection
### Aliases: select.process
### Keywords: feature selection classification information gain symmetrical
###   uncertainty chi-squared missing values

### ** Examples

# example for dataset without missing values
data(data_test)

# class label must be factor
data_test[,ncol(data_test)]<-as.factor(data_test[,ncol(data_test)])

method="InformationGain"
disc<-"MDL"
thr=0.1
thr.cons=0.05
attrs.nominal=numeric()
max.f=15

out=select.process(data_test,method=method,disc.method=disc,
threshold=thr, threshold.consis=thr.cons,attrs.nominal=attrs.nominal,
max.no.features=max.f)


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

method="InformationGain"
disc<-"MDL"
thr=0.1
thr.cons=0.05
max.f=15

out=select.process(xdata,method=method,disc.method=disc,
threshold=thr, threshold.consis=thr.cons,attrs.nominal=attrs.nominal,
max.no.features=max.f)



