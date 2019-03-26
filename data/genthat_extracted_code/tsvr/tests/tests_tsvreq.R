context("tsvreq")

test_that("test tsvreq constructor",{
  h<-tsvreq(ts=c(1,2,3),com=c(2,2,2),comnull=c(2,1,2),tsvr=c(1,2,1),wts=c(1,1,1))
  expect_s3_class(h,"tsvreq")
  expect_equal(h$ts,c(1,2,3))
  expect_equal(h$com,c(2,2,2))
  expect_equal(h$comnull,c(2,1,2))
  expect_equal(h$tsvr,c(1,2,1))
  expect_equal(h$wts,c(1,1,1))
})
