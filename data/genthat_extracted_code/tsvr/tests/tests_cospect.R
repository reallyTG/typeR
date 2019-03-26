context("cospect")

test_that("test ancillary properties",{
  set.seed(303)
  X<-matrix(runif(10*20)+1,10,20)
  h<-cospect(X)
  lents<-dim(X)[2]
  
  expect_type(h,"list")
  expect_equal(names(h),c("frequency","cospectrum"))
  expect_equal(h$frequency,0:(lents-1)/lents)
  expect_equal(dim(h$cospectrum),c(10,10,20))
})

test_that("test properties",{
  set.seed(201)
  X<-matrix(runif(10*20)+1,10,20)
  h<-cospect(X)
  expect_equal(sum(h$cospectrum[1,1,2:20]),var(X[1,]))  
  expect_equal(sum(h$cospectrum[2,2,2:20]),var(X[2,]))  
  expect_equal(sum(h$cospectrum[1,2,2:20]),cov(X[1,],X[2,]))
  expect_equal(sum(h$cospectrum[2,1,2:20]),cov(X[1,],X[2,]))
})

test_that("test special cases",{
  times<-0:99
  s1<-sin(2*pi*times/5)+1
  s2<-sin(2*pi*times/5+pi/2)+2
  X<-t(matrix(c(s1,s2),length(times),2))
  h<-cospect(X)
  biginds<-c(1,21,81)
  smallinds<-setdiff(1:100,biginds)
  expect_equal(all(h$cospectrum[1,1,biginds]>rep(.1,3)),TRUE)
  expect_equal(all(h$cospectrum[1,1,smallinds]<rep(1e-4,97)),TRUE)
  expect_equal(h$cospectrum[1,2,2:100],rep(0,99))
})

test_that("test a general case for reproducibility on future runs",{
  set.seed(201)
  X<-matrix(runif(10*20)+1,10,20)
  h<-cospect(X)
  expect_known_value(h,file="../vals/cospect_testval_01",update=FALSE)
})
