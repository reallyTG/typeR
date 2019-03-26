library(Biocomb)


### Name: chi2.algorithm
### Title: Select the subset of features
### Aliases: chi2.algorithm
### Keywords: feature selection classification chi-squared missing values

### ** Examples

# example for dataset without missing values
#p1=Sys.time()
data(data_test)
# not all features to select
xdata=data_test[,c(1:6,ncol(data_test))]
# class label must be factor
xdata[,ncol(xdata)]<-as.factor(xdata[,ncol(xdata)])
attrs.nominal=numeric()
threshold=0
out=chi2.algorithm(matrix=xdata,attrs.nominal=attrs.nominal,threshold=threshold)
#Sys.time()-p1



