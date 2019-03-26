boolSkip=F



test_that("Check 67.1 - testing calculation of Nucleolus with game vector A=(2,6,5,15,1,18,14) " ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v<-c(2,6,5,15,1,18,14)
  expected_x=c(2,7,5)
  
  expect_equal(nucleolus(v),expected_x)
  
})


