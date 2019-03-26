library(Biocomb)


### Name: plotClass.result
### Title: Plots the results of classifier validation schemes
### Aliases: plotClass.result
### Keywords: feature selection classification missing values

### ** Examples

# example for dataset without missing values

data(leukemia72_2)

# class label must be factor
leukemia72_2[,ncol(leukemia72_2)]<-as.factor(leukemia72_2[,ncol(leukemia72_2)])

class.method=c("svm","nn")
method="InformationGain"
disc<-"MDL"
cross.method<-"fold-crossval"

flag.feature=TRUE
thr=0.1
thr.cons=0.05
attrs.nominal=numeric()
max.f=10

out=classifier.loop(leukemia72_2,classifiers=class.method,
 feature.selection=method,disc.method=disc,
 threshold=thr, threshold.consis=thr.cons,attrs.nominal=attrs.nominal,
  no.feat=max.f,flag.feature=flag.feature,method.cross=cross.method)

plotClass.result(out$true.classified, cross.method, class.method, flag.feature, max.f)

# example for dataset with missing values
## Not run: 
##D data(leukemia_miss)
##D xdata=leukemia_miss
##D 
##D # class label must be factor
##D xdata[,ncol(xdata)]<-as.factor(xdata[,ncol(xdata)])
##D 
##D # nominal features must be factors
##D attrs.nominal=101
##D xdata[,attrs.nominal]<-as.factor(xdata[,attrs.nominal])
##D 
##D delThre=0.2
##D out=input_miss(xdata,"mean.value",attrs.nominal,delThre)
##D if(out$flag.miss)
##D {
##D  xdata=out$data
##D }
##D 
##D class.method=c("svm","nn")
##D method="InformationGain"
##D disc<-"MDL"
##D cross.method<-"fold-crossval"
##D 
##D flag.feature=TRUE
##D thr=0.1
##D thr.cons=0.05
##D max.f=10
##D 
##D out=classifier.loop(xdata,classifiers=class.method,
##D  feature.selection=method,disc.method=disc,
##D  threshold=thr, threshold.consis=thr.cons,attrs.nominal=attrs.nominal,
##D  no.feat=max.f,flag.feature=flag.feature,method.cross=cross.method)
##D 
##D plotClass.result(out$true.classified, cross.method, class.method, flag.feature, max.f)
## End(Not run)



