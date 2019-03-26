context("mdsOpt")

test_that("mdsOpt", {
  data<-matrix(c(1,1,5,7,3,3.5,4,1,1.5,2,2,3,3.5,4),7,2)
  clusters<-c(1,1,2,2,3,3,3)
  expect_equal(round(index.DB(data,clusters)$DB,4),0.4431)
})
