context("errcheck_vreq")
library(tsvr)

test_that("test ability to catch things that are not single finite numbers",{
  expect_error(errcheck_vreq("test",1,2),"Error in vreq class: all slots must be numeric")
  expect_error(errcheck_vreq(c(1,2),1,2),"Error in vreq class: all slots must be single numbers")
  expect_error(errcheck_vreq(Inf,1,2),"Error in vreq class: non-finite values not allowed")
})

test_that("test abilty to catch non-positives",{
  expect_error(errcheck_vreq(-1,1,1),"Error in vreq class: only positive values allowed")
})

test_that("test ability to catch the equation not being satisfied",{
  expect_error(errcheck_vreq(1,2,3),"Error in vreq class: com should equal comnull times vr")
})


