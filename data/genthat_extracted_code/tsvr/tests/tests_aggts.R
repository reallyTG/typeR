context("aggts")

test_that("test format of output",{
  set.seed(101)
  X<-matrix(runif(10*100),10,100)
  tsvr<-tsvreq_classic(X)
  res<-aggts(tsvr,tsvr$ts[tsvr$ts>4])
  expect_s3_class(res,"vreq_classic_ag")
  expect_s3_class(res,"vreq")
  expect_s3_class(res,"list")
  expect_equal(names(res),c("com","comnull","vr","ts"))
  expect_equal(res$com,res$comnull*res$vr)
  expect_equal(res$ts,tsvr$ts[tsvr$ts>4 | tsvr$ts<4/3])
})

test_that("test accuracy of output",{
  #aggregate all time scales, see if you get the classic vr equation
  set.seed(101)
  X<-matrix(runif(10*100),10,100)
  obj<-tsvreq_classic(X)
  ts<-obj$ts
  res<-aggts(obj,ts)
  vrres<-vreq_classic(X)
  expect_equal(vrres$com,res$com) 
  expect_equal(vrres$comnull,res$comnull)
  expect_equal(vrres$vr,res$vr)
  
  #do again for an odd-length time series
  X<-matrix(runif(10*99),10,99)
  obj<-tsvreq_classic(X)
  ts<-obj$ts
  res<-aggts(obj,ts)
  vrres<-vreq_classic(X)
  expect_equal(vrres$com,res$com) 
  expect_equal(vrres$comnull,res$comnull)
  expect_equal(vrres$vr,res$vr)
  
  #test using the data embedded in the package
  d<-t(as.matrix(JRGdat[,2:dim(JRGdat)[2]]))
  obj<-tsvreq_classic(d)
  resL<-aggts(obj,obj$ts[obj$ts>=4])
  resS<-aggts(obj,obj$ts[obj$ts<4])
  expect_equal(round(resL$vr,3),0.267) #expectation based on what Lei got from independent code
  expect_equal(round(resS$vr,3),1.367) #expectation based on what Lei got from independent code
  
  resL2<-aggts(obj,obj$ts[obj$ts>=4 | obj$ts<=4/3])
  expect_equal(resL,resL2)
  resS2<-aggts(obj,obj$ts[obj$ts<4 & obj$ts>4/3])
  expect_equal(resS,resS2)
})