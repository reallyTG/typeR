library(grr)


### Name: sample2
### Title: A wrapper for 'sample.int' and 'extract' that makes it easy to
###   quickly sample rows from any object, including Matrix and sparse
###   matrix objects.
### Aliases: sample2

### ** Examples


#Sampling from a list
l1<-as.list(1:1e6)
b<-sample2(l1,1e5)

#Sampling from a data frame
orders<-data.frame(orderNum=sample(1e5, 1e6, TRUE),
   sku=sample(1e3, 1e6, TRUE),
   customer=sample(1e4,1e6,TRUE),stringsAsFactors=FALSE)
   
a<-sample2(orders,250000) 

#With oversampling sample2 can be much faster than the alternatives,
#with the caveat that it does not preserve row names.
system.time(a<-sample2(orders,2000000,TRUE))
system.time(b<-orders[sample.int(nrow(orders),2000000,TRUE),])
## Not run: 
##D 
##D system.time(c<-dplyr::sample_n(orders,2000000,replace=TRUE))
##D 
##D #Can quickly sample for sparse matrices while preserving sparsity
##D sm<-rsparsematrix(20000000,10000,density=.0001)
##D sm2<-sample2(sm,1000000)
## End(Not run)



