library(Biocomb)


### Name: ProcessData
### Title: Select the subset of features
### Aliases: ProcessData
### Keywords: feature selection classification discretization

### ** Examples

# example for dataset without missing values
data(data_test)

# class label must be factor
data_test[,ncol(data_test)]<-as.factor(data_test[,ncol(data_test)])

disc<-"MDL"
attrs.nominal=numeric()
flag=FALSE
out=ProcessData(matrix=data_test,disc.method=disc,
attrs.nominal=attrs.nominal,flag=flag)



