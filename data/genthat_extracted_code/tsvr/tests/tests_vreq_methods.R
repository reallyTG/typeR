context("vreq_methods")

test_that("test the set methods",{
  h<-list(com=2,comnull=1,vr=2)
  expect_error(set_com(h,3),"Error in set_com: set_com not defined for this class")
  expect_error(set_comnull(h,2),"Error in set_comnull: set_comnull not defined for this class")
  expect_error(set_vr(h,12),"Error in set_vr: set_vr not defined for this class")
  h<-vreq(com=2,comnull=1,vr=2)
  expect_error(set_com(h,3),"Error in set_com: vreq slots should not be changed individually")
  expect_error(set_comnull(h,2),"Error in set_comnull: vreq slots should not be changed individually")
  expect_error(set_vr(h,12),"Error in set_vr: vreq slots should not be changed individually")
})

test_that("test the get methods",{
  h<-list(com=2,comnull=1,vr=2)
  expect_error(get_com(h),"Error in get_com: get_com not defined for this class")
  expect_error(get_comnull(h),"Error in get_comnull: get_comnull not defined for this class")
  expect_error(get_vr(h),"Error in get_vr: get_vr not defined for this class")
  h<-vreq(com=2,comnull=1,vr=2)
  expect_equal(get_com(h),2)
  expect_equal(get_comnull(h),1)
  expect_equal(get_vr(h),2)
})

test_that("test the summary method",{
  inp<-vreq(com=2,comnull=1,vr=2)
  out<-summary(inp)
  expect_equal(names(out),c("class","com","comnull","vr"))
  expect_equal(out$class,"vreq")
  expect_equal(out$com,2)
  expect_equal(out$comnull,1)
  expect_equal(out$vr,2)
})

test_that("test the print method",{
  inp<-vreq(com=2,comnull=1,vr=2)
  expect_output(print(inp),"Object of class vreq:\n com: 2\n comnull: 1\n vr: 2",fixed=TRUE)
})
