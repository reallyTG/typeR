boolSkip=F


test_that("Check 70.1 - testing calculation of class Modiclus" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  
  v<-c( 0,  0,  0,  1,  1, 0, 1)
  result=modiclus(v)
  
  expect_equal(result,c(0.5,0.25,0.25),tolerance=1e-3)
  
})



