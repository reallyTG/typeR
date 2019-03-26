library(grr)


### Name: extract
### Title: Extract/return parts of objects
### Aliases: extract

### ** Examples

#Typically about twice as fast on normal subselections
orders<-data.frame(orderNum=1:1e5,
 sku=sample(1e3, 1e5, TRUE),
 customer=sample(1e4,1e5,TRUE))
a<-sample(1e5,1e4)
system.time(b<-orders[a,])
system.time(c<-extract(orders,a))
rownames(b)<-NULL
rownames(c)<-NULL
identical(b,c)

#Speedup increases to 50-100x with oversampling 
a<-sample(1e5,1e6,TRUE)
system.time(b<-orders[a,])
system.time(c<-extract(orders,a))
rownames(b)<-NULL
rownames(c)<-NULL
identical(b,c)

#Can create function calls that work for multiple data types
alist<-as.list(1:50)
avector<-1:50
extract(alist,1:5)
extract(avector,1:5)
extract(orders,1:5)#'

## Not run: 
##D orders<-data.frame(orderNum=as.character(sample(1e5, 1e6, TRUE)),
##D  sku=sample(1e3, 1e6, TRUE),
##D  customer=sample(1e4,1e6,TRUE))
##D system.time(a<-sample(1e6,1e7,TRUE))
##D system.time(b<-orders[a,])
##D system.time(c<-extract(orders,a))
## End(Not run)



