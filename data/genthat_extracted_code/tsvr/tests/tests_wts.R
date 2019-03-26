context("wts")

test_that("test for correct format",{
  set.seed(101)
  X<-matrix(runif(10*100),10,100)
  res<-wts(X)
  expect_equal(class(res),"list")
  expect_equal(names(res),c("frequency","wts"))
  expect_equal(res$frequency,1:99/100)
})

test_that("test for correct value",{
  set.seed(102)
  X<-matrix(runif(2*100),2,100)
  res<-wts(X)
  tslength<-dim(X)[2]
  h<-(((Mod(fft(X[1,])))^2+(Mod(fft(X[2,])))^2)/sum(apply(FUN=var,MARGIN=1,X=X)))/tslength/(tslength-1)
  expect_equal(res$wts,h[2:length(h)])
})
