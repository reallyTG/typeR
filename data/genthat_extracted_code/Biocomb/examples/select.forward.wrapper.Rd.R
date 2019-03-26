library(Biocomb)


### Name: select.forward.wrapper
### Title: Select the subset of features
### Aliases: select.forward.wrapper
### Keywords: feature selection classification information gain missing
###   values

### ** Examples

# example for dataset without missing values
data(data_test)

# class label must be factor
data_test[,ncol(data_test)]<-as.factor(data_test[,ncol(data_test)])

out=select.forward.wrapper(dattable=data_test)



