library(DMwR2)


### Name: centralValue
### Title: Obtain statistic of centrality
### Aliases: centralValue
### Keywords: univar

### ** Examples

# An example with numerical data
x <- rnorm(100)
centralValue(x)
# An example with nominal data
y <-
factor(sample(1:10,200,replace=TRUE),levels=1:10,labels=paste('v',1:10,sep=''))
centralValue(y)



