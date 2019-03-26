library(Biocomb)


### Name: select.forward.Corr
### Title: Select the subset of features
### Aliases: select.forward.Corr
### Keywords: feature selection classification correlation missing values

### ** Examples

# example for dataset without missing values
data(data_test)

# class label must be factor
data_test[,ncol(data_test)]<-as.factor(data_test[,ncol(data_test)])
disc<-"MDL"
attrs.nominal=numeric()
out=select.forward.Corr(matrix=data_test,disc.method=disc,
attrs.nominal=attrs.nominal)



