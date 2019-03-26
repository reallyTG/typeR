context("print.summary_tsvr")

test_that("test print.summary_tsvr on a vreq object",{
  vreqexamp<-vreq(2,2,1)
  h<-summary(vreqexamp)
  expect_equal(class(h),c("summary_tsvr","list"))
  expect_equal(names(h),c("class","com","comnull","vr"))
  expect_output(print(h),"class: vreq\ncom: 2\ncomnull: 2\nvr: 1",fixed=TRUE)
})