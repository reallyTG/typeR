library(Matrix.utils)


### Name: merge.Matrix
### Title: Merges two Matrices or matrix-like objects
### Aliases: merge.Matrix join.Matrix

### ** Examples


orders<-Matrix(as.matrix(data.frame(orderNum=1:1000, 
 customer=sample(100,1000,TRUE)))) 
 cancelledOrders<-Matrix(as.matrix(data.frame(orderNum=sample(1000,100), 
 cancelled=1))) 
skus<-Matrix(as.matrix(data.frame(orderNum=sample(1000,10000,TRUE), 
sku=sample(1000,10000,TRUE), amount=runif(10000)))) 
a<-merge(orders,cancelledOrders,orders[,'orderNum'],cancelledOrders[,'orderNum'])
b<-merge(orders,cancelledOrders,orders[,'orderNum'],cancelledOrders[,'orderNum'],all.x=FALSE)
c<-merge(orders,skus,orders[,'orderNum'],skus[,'orderNum'])

#The above Matrices could be converted to matrices or data.frames and handled in other methods.  
#However, this is not possible in the sparse case, which can be handled by this function:
sm<-cbind2(1:200000,rsparsematrix(200000,10000,density=.0001))
sm2<-cbind2(sample(1:200000,50000,TRUE),rsparsematrix(200000,10,density=.01))
sm3<-merge.Matrix(sm,sm2,by.x=sm[,1],by.y=sm2[,1])

 ## Not run: 
##D #merge.Matrix can also handle many other data types, such as data frames, and is generally fast.
##D orders<-data.frame(orderNum=as.character(sample(1e5, 1e6, TRUE)),
##D    sku=sample(1e3, 1e6, TRUE),
##D    customer=sample(1e4,1e6,TRUE),stringsAsFactors=FALSE)
##D cancelledOrders<-data.frame(orderNum=as.character(sample(1e5,1e4)),
##D    cancelled=1,stringsAsFactors=FALSE)
##D system.time(a<-merge.Matrix(orders,cancelledOrders,orders[,'orderNum'],
##D    cancelledOrders[,'orderNum']))
##D system.time(b<-merge.data.frame(orders,cancelledOrders,all.x = TRUE,all.y=TRUE))
##D system.time(c<-dplyr::full_join(orders,cancelledOrders))
##D system.time({require(data.table);
##D d<-merge(data.table(orders),data.table(cancelledOrders),
##D    by='orderNum',all=TRUE,allow.cartesian=TRUE)})
##D 
##D orders<-data.frame(orderNum=sample(1e5, 1e6, TRUE), sku=sample(1e3, 1e6,
##D TRUE), customer=sample(1e4,1e6,TRUE),stringsAsFactors=FALSE) 
##D cancelledOrders<-data.frame(orderNum=sample(1e5,1e4),cancelled=1,stringsAsFactors=FALSE)
##D system.time(b<-merge.Matrix(orders,cancelledOrders,orders[,'orderNum'], 
##D cancelledOrders[,'orderNum'])) 
##D system.time(e<-dplyr::full_join(orders,cancelledOrders)) 
##D system.time({require(data.table);
##D  d<-merge(data.table(orders),data.table(cancelledOrders),
##D  by='orderNum',all=TRUE,allow.cartesian=TRUE)})
##D 
##D #In certain cases, merge.Matrix can be much faster than alternatives. 
##D one<-as.character(1:1000000) 
##D two<-as.character(sample(1:1000000,1e5,TRUE)) 
##D system.time(b<-merge.Matrix(one,two,one,two)) 
##D system.time(c<-dplyr::full_join(data.frame(key=one),data.frame(key=two))) 
##D system.time({require(data.table);
##D  d<-merge(data.table(data.frame(key=one)),data.table(data.frame(key=two)),
##D  by='key',all=TRUE,allow.cartesian=TRUE)})
## End(Not run)




