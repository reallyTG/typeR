boolSkip=F

test_that("Check 19.1 - marginal values with 3 players, A = {0,0,0,1,1,0,1}" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  #glove game with l={1}, r={2,3} with 3 players
  v=c(0,0,0,1,1,0,1)
  result=getMarginalContributions(v)
  compareValues = matrix(data = c(0,0,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0), nrow = 6, ncol = 3)
  expect_equal(result$marginal_values, compareValues)
})