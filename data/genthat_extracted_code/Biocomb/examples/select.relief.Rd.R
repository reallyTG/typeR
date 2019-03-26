library(Biocomb)


### Name: select.relief
### Title: Ranks the features
### Aliases: select.relief
### Keywords: feature selection classification missing values

### ** Examples

# example for dataset without missing values
data(data_test)

# class label must be factor
data_test[,ncol(data_test)]<-as.factor(data_test[,ncol(data_test)])

out=select.relief(data_test)

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
##D out=select.relief(xdata)
## End(Not run)



