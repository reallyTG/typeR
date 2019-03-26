context("vr")

test_that("test the classic case",{
  set.seed(101)
  X<-matrix(runif(3000),30,100)
  classicres<-vr(X)
  expect_equal(classicres,var(colSums(X))/sum(apply(FUN=var,X=X,MARGIN=1)))
})

test_that("test the LdM case",{
  set.seed(102)
  X<-matrix(runif(3000),30,100)
  ldmres<-vr(X,"LdM")
  expect_equal(ldmres,var(colSums(X))/(sum(sqrt(apply(FUN=var,X=X,MARGIN=1)))^2))
})
