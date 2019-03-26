context("normalization")

test_that("normalization", {
  a<-matrix(runif(100,1,10),10,10)
  b<-data.Normalization(a,type="n4")
  expect_equal(round(as.numeric(attr(b,"normalized:shift")[1]),2),round(min(a[,1]),2))
})
