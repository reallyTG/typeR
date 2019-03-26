boolSkip=F

#URL: https://www.math.ucla.edu/~tom/Game_Theory/coal.pdf
test_that("Check 49.1 - nucleolus - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(-1,0,1,3,4,2,5)
  result = nucleolus(v)
  expect_equal(result, c(8/3,2/3,5/3))

})