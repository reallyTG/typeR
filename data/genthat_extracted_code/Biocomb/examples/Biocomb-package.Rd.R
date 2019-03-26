library(Biocomb)


### Name: Biocomb-package
### Title: Tools for Data Mining
### Aliases: Biocomb-package Biocomb
### Keywords: package feature selection classification information gain
###   Relative cost curves HUM roc auc

### ** Examples

data(data_test)
# class label must be factor
data_test[,ncol(data_test)]<-as.factor(data_test[,ncol(data_test)])

# Perform the feature selection using the fast correlation-based filter algorithm
disc="MDL"
threshold=0.2
attrs.nominal=numeric()
out=select.fast.filter(data_test,disc.method=disc,threshold=threshold,
attrs.nominal=attrs.nominal)

# Perform the classification with cross-validation of results
out=classifier.loop(data_test,classifiers=c("svm","lda","rf"),
 feature.selection="auc", flag.feature=FALSE,method.cross="fold-crossval")

# Calculate the coordinates for 2D- or 3D- ROC curve and the optimal threshold point
## Not run: 
##D data(data_test)
##D xllim<--4
##D xulim<-4
##D yllim<-30
##D yulim<-110
##D 
##D attrs.no=1
##D pos.Class<-levels(data_test[,ncol(data_test)])[1]
##D add.legend<-TRUE
##D 
##D aacs<-rep(0,length(attrs.no))
##D color<-c(1:length(attrs.no))
##D 
##D out <- cost.curve(data_test,attrs.no, pos.Class,col=color[1],add=F,
##D  xlim=c(xllim,xulim),ylim=c(yllim,yulim))
## End(Not run)



