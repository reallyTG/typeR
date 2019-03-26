library(VarReg)
context("checking linVarReg function")
data(lidar)
lid<-data.frame(lidar$logratio, lidar$range)
test_that("Checking linear variance model", {
  linmodel<-linVarReg(dat=lidar, var.ind=c(2),mean.ind=c(2), para.space='all', maxit=10000)
  expect_equal_to_reference(linmodel, "Model1.rds")
})
test_that("Checking constant variance model", {
  convar<-linVarReg(dat=lidar, var.ind=FALSE,mean.ind=c(2), para.space='all', maxit=10000)
  expect_equal_to_reference(convar, "Model2.rds")
})
test_that("Checking constant mean model", {
  conmean<-linVarReg(dat=lidar, var.ind=c(2),mean.ind=c(0), para.space='all', maxit=10000)
  expect_equal_to_reference(conmean, "Model3.rds")
})
test_that("Checking zero mean model", {
  zeromean<-linVarReg(dat=lidar, var.ind=c(2),mean.ind=NULL, para.space='all', maxit=10000)
  expect_equal_to_reference(zeromean, "Model4.rds")
})
test_that("Checking parameter space = neg", {
  pneg<-linVarReg(dat=lidar, var.ind=c(2),mean.ind=c(2), para.space='negative', maxit=10000)
  expect_equal_to_reference(pneg, "Model5.rds")
})
test_that("Checking parameter space = pos", {
  ppos<-linVarReg(dat=lidar, var.ind=c(2),mean.ind=c(2), para.space='positive', maxit=10000)
  expect_equal_to_reference(ppos, "Model6.rds")
})

test_that("Checking multiple covariates", {
  library(splines)
  b<-bs(lidar$range, df=6, degree=2)
  l2<-data.frame(lidar, b)
  many<-linVarReg(dat=l2, var.ind=c(3,4,5,6,7,8),mean.ind=c(3,4,5,6,7,8), para.space='all', maxit=1000)
  expect_equal_to_reference(many, "Model7.rds")
})

