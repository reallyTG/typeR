test_that("second moment from e_trunct matches simulations", {
  x = rt(1000000,df=4)
  a = c(-2,-2,-1,1)
  b = c(-1,1,2,2)
  for(i in 1:4){
    expect_equal(mean(x[x<b[i] & x>a[i]]^2),e_trunct(a[i],b[i],4,2),tolerance=0.01)
  }
})


test_that("first moment from e_trunct matches simulations", {
  x = rt(1000000,df=4)
  a = c(-2,-2,-1,1)
  b = c(-1,1,2,2)
  for(i in 1:4){
    expect_equal(mean(x[x<b[i] & x>a[i]]),e_trunct(a[i],b[i],4,1),tolerance=0.01)
  }
})
