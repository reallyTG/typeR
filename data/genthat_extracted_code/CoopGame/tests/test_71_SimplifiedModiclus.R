boolSkip=F


test_that("Check 70.1 - testing calculation of class SimplifiedModiclus" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  expected_result=c(2/3,1/6,1/6)
  v<-c( 0,  0,  0,  1,  1, 0, 1)
  result=simplifiedModiclus(v)
  expect_equal(result,expected_result,tolerance=1e-3)
})
