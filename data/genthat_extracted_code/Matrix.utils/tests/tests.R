library(Matrix.utils)
context("All tests")

test_that("dMcast dimensions are correct", {
  tmp<-data.frame(lapply(letters,function (x) (rep(letters,1500))))
  colnames(tmp)<-letters
  d<-dMcast(tmp,~.)
  expect_equal(nrow(d),nrow(tmp))
  a<-dMcast(warpbreaks,~.)
  expect_equal(nrow(a),nrow(warpbreaks))
  b<-dMcast(warpbreaks,~.,as.factors=TRUE)
  expect_lt(ncol(a),ncol(b))
})

test_that("dMcast air quality tests", {
  melt<-function(data,idColumns)
  {
    cols<-setdiff(colnames(data),idColumns)
    results<-lapply(cols,function (x) cbind(data[,idColumns],variable=x,value=as.numeric(data[,x])))
    results<-Reduce(rbind,results)
  }
  names(airquality) <- tolower(names(airquality))
  aqm <- melt(airquality, idColumns=c("month", "day"))
  a<-dMcast(aqm, month:day ~variable,fun.aggregate = 'mean',value.var='value')
  expect_equal(nrow(unique(aqm[,c('month','day')])),nrow(a))
  aqm[aqm==30]<-NA
  aqm$day<-as.factor(aqm$day)
  b<-dMcast(aqm, month:day ~variable,fun.aggregate = 'mean',value.var='value')
  expect_equal(nrow(unique(aqm[,c('month','day')])),nrow(b))
  aqm[aqm=='temp']<-NA
  c<-dMcast(aqm, month:day ~variable,fun.aggregate = 'mean',value.var='value')
  expect_equal(length(unique(aqm$variable)),ncol(c))
  d<-dMcast(aqm, month:day ~variable,fun.aggregate = 'mean',value.var='value',factor.nas = FALSE)
  expect_equal(ncol(d),3)
})

test_that("merge.Matrix can handle mixed types", {
  cancelledOrders<-data.frame(orderNum=as.character(sample(1e3,1e2)),
                              cancelled=1,stringsAsFactors=FALSE)
  orders<-Matrix(as.matrix(data.frame(orderNum=1:1000, 
                                      customer=sample(100,1000,TRUE)))) 
  expect_s3_class(merge.Matrix(cancelledOrders,orders,by.y=orders[,'orderNum'],by.x=as.numeric(cancelledOrders$orderNum)),'data.frame')
  expect_error(merge.Matrix(orders,cancelledOrders,by.x=orders[,'orderNum'],by.y=as.numeric(cancelledOrders$orderNum)))
  expect_s3_class(merge.Matrix(orders,cancelledOrders,by.x=orders[,'orderNum'],by.y=as.numeric(cancelledOrders$orderNum),out.class='data.frame'),'data.frame')
  cancelledOrders$orderNum<-as.numeric(cancelledOrders$orderNum)
  expect_s4_class(merge.Matrix(orders,cancelledOrders,by.x=orders[,'orderNum'],by.y=as.numeric(cancelledOrders$orderNum)),'Matrix')
  cancelledOrders<-as.matrix(cancelledOrders)
  expect_s4_class(merge.Matrix(orders,cancelledOrders,by.x=orders[,'orderNum'],by.y=as.numeric(cancelledOrders[,'orderNum'])),'Matrix')
  expect_is(merge.Matrix(cancelledOrders,orders,by.y=orders[,'orderNum'],by.x=as.numeric(cancelledOrders[,'orderNum'])),'matrix')
  
})

test_that("rBind.fill can handle mixed types", {
  df1 = data.frame(a = c(1,2,3), d = c(4,5,6))
  df2 = data.frame(d = c(7,8), b = c(9,10))
  df3 = data.frame(e = 'a')
  expect_s3_class(rBind.fill(df1,df2,fill=NA),'data.frame')
  expect_s4_class(rBind.fill(as(df1,'Matrix'),df2,fill=0),'Matrix')
  expect_is(rBind.fill(as.matrix(df1),as(df2,'Matrix'),c(1,2),fill=0),'matrix')
  expect_s3_class(rBind.fill(as(as.matrix(df1),'Matrix'),df2,df3,out.class='data.frame'),'data.frame')
  # rBind.fill(c(1,2,3),list(4,5,6,7))
  # rBind.fill(df1,c(1,2,3,4))
})
