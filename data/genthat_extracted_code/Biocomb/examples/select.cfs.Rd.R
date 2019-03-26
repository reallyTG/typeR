library(Biocomb)


### Name: select.cfs
### Title: Select the subset of features
### Aliases: select.cfs
### Keywords: feature selection classification correlation missing values

### ** Examples

# example for dataset without missing values
data(data_test)

# class label must be factor
data_test[,ncol(data_test)]<-as.factor(data_test[,ncol(data_test)])
out=select.cfs(matrix=data_test)



