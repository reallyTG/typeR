library(Matrix.utils)


### Name: aggregate.Matrix
### Title: Compute summary statistics of a Matrix
### Aliases: aggregate.Matrix

### ** Examples

skus<-Matrix(as.matrix(data.frame(
   orderNum=sample(1000,10000,TRUE),
   sku=sample(1000,10000,TRUE),
   amount=runif(10000))),sparse=TRUE)
#Calculate sums for each sku
a<-aggregate.Matrix(skus[,'amount'],skus[,'sku',drop=FALSE],fun='sum')
#Calculate counts for each sku
b<-aggregate.Matrix(skus[,'amount'],skus[,'sku',drop=FALSE],fun='count')
#Calculate mean for each sku
c<-aggregate.Matrix(skus[,'amount'],skus[,'sku',drop=FALSE],fun='mean')

m<-rsparsematrix(1000000,100,.001)
labels<-as.factor(sample(1e4,1e6,TRUE))
b<-aggregate.Matrix(m,labels)

## Not run: 
##D orders<-data.frame(orderNum=as.factor(sample(1e6, 1e7, TRUE)),
##D    sku=as.factor(sample(1e3, 1e7, TRUE)),
##D    customer=as.factor(sample(1e4,1e7,TRUE)),
##D    state = sample(letters, 1e7, TRUE), amount=runif(1e7))
##D system.time(d<-aggregate.Matrix(orders[,'amount',drop=FALSE],orders$orderNum))
##D system.time(e<-aggregate.Matrix(orders[,'amount',drop=FALSE],orders[,c('customer','state')]))
## End(Not run)



