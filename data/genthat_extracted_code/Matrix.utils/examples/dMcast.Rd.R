library(Matrix.utils)


### Name: dMcast
### Title: Casts or pivots a long 'data frame' into a wide sparse matrix
### Aliases: dMcast

### ** Examples

#Classic air quality example
melt<-function(data,idColumns)
{
  cols<-setdiff(colnames(data),idColumns)
  results<-lapply(cols,function (x) cbind(data[,idColumns],variable=x,value=as.numeric(data[,x])))
  results<-Reduce(rbind,results)
}
names(airquality) <- tolower(names(airquality))
aqm <- melt(airquality, idColumns=c("month", "day"))
dMcast(aqm, month:day ~variable,fun.aggregate = 'mean',value.var='value')
dMcast(aqm, month ~ variable, fun.aggregate = 'mean',value.var='value') 

#One hot encoding
#Preserving numerics
dMcast(warpbreaks,~.)
#Pivoting numerics as well
dMcast(warpbreaks,~.,as.factors=TRUE)

## Not run: 
##D orders<-data.frame(orderNum=as.factor(sample(1e6, 1e7, TRUE)), 
##D    sku=as.factor(sample(1e3, 1e7, TRUE)), 
##D    customer=as.factor(sample(1e4,1e7,TRUE)), 
##D    state = sample(letters, 1e7, TRUE),
##D    amount=runif(1e7)) 
##D # For simple aggregations resulting in small tables, dcast.data.table (and
##D    reshape2) will be faster
##D system.time(a<-dcast.data.table(as.data.table(orders),sku~state,sum,
##D    value.var = 'amount')) # .5 seconds 
##D system.time(b<-reshape2::dcast(orders,sku~state,sum,
##D    value.var = 'amount')) # 2.61 seconds 
##D system.time(c<-dMcast(orders,sku~state,
##D    value.var = 'amount')) # 8.66 seconds 
##D    
##D # However, this situation changes as the result set becomes larger 
##D system.time(a<-dcast.data.table(as.data.table(orders),customer~sku,sum,
##D    value.var = 'amount')) # 4.4 seconds 
##D system.time(b<-reshape2::dcast(orders,customer~sku,sum,
##D    value.var = 'amount')) # 34.7 seconds 
##D  system.time(c<-dMcast(orders,customer~sku,
##D    value.var = 'amount')) # 14.55 seconds 
##D    
##D # More complicated: 
##D system.time(a<-dcast.data.table(as.data.table(orders),customer~sku+state,sum,
##D    value.var = 'amount')) # 16.96 seconds, object size = 2084 Mb 
##D system.time(b<-reshape2::dcast(orders,customer~sku+state,sum,
##D    value.var = 'amount')) # Does not return 
##D system.time(c<-dMcast(orders,customer~sku:state,
##D    value.var = 'amount')) # 21.53 seconds, object size = 116.1 Mb
##D 
##D system.time(a<-dcast.data.table(as.data.table(orders),orderNum~sku,sum,
##D    value.var = 'amount')) # Does not return 
##D system.time(c<-dMcast(orders,orderNum~sku,
##D    value.var = 'amount')) # 24.83 seconds, object size = 175Mb
##D 
##D system.time(c<-dMcast(orders,sku:state~customer,
##D    value.var = 'amount')) # 17.97 seconds, object size = 175Mb
##D        
## End(Not run)



