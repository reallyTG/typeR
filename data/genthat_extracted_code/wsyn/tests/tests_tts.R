context("tts")

test_that("test the tts creator function for class", {
  times<-1:10
  timescales<-1/c(1:10)
  values<-matrix(1,length(times),length(timescales))
  h<-tts(times,timescales,values)
  expect_s3_class(h,"tts")
  expect_s3_class(h,"list")
})

test_that("test the tts creator function for output", {
  times<-1:10
  timescales<-1/c(1:10)
  values<-matrix(1,length(times),length(timescales))
  h<-tts(times,timescales,values)
  expect_equal(h$times,times)
  expect_equal(h$timescales,timescales)
  expect_equal(h$values,values)
})
