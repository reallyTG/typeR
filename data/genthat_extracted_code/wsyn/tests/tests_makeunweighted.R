context("makeunweighted")

test_that("test some examples",{
  mat<-matrix(runif(100),10,10)
  res<-makeunweighted(mat,.05)
  expect_equal(diag(res),rep(NA*numeric(1),10))
  diag(res)<-999
  diag(mat)<-999
  expect_equal(which(mat<0.05),which(res==1))
  expect_equal(which(mat>=.05 & mat<2),which(res==0))
})