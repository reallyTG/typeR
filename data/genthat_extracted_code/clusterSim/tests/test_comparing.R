context("comparing")

test_that("comparing", {
  a<-rep(1:3,each=10)
  b<-rep(sample(1:3,3),each=10)
  expect_equal(comparing.Partitions(a,b,type="crand"), 1)
})
