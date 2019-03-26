context("vreq")
library(tsvr)

test_that("test vreq constructor",{
  h<-vreq(com=2,comnull=2,vr=1)
  expect_s3_class(h,"vreq")
  expect_equal(h$com,2)
  expect_equal(h$comnull,2)
  expect_equal(h$vr,1)
})

