boolSkip=F

#Reference BERTINI, GAMBARELLI, STACH 
#A Public Help Index
#http://download.springer.com/static/pdf/406/chp%253A10.1007%252F978-3-540-73382-9_5.pdf?originUrl=http%3A%2F%2Flink.springer.com%2Fchapter%2F10.1007%2F978-3-540-73382-9_5&token2=exp=1487584377~acl=%2Fstatic%2Fpdf%2F406%2Fchp%25253A10.1007%25252F978-3-540-73382-9_5.pdf%3ForiginUrl%3Dhttp%253A%252F%252Flink.springer.com%252Fchapter%252F10.1007%252F978-3-540-73382-9_5*~hmac=601a3649d43838b8b22d3b4e01a7a51abaf028cc005c63263a3654cb7000ebec
test_that("Check 20.1 - publicHelpIndex",{
  if(boolSkip){
    skip("Test was skipped")
  }
  result=publicHelpIndex(v=c(0,0,0,1,1,0,1))

  expect_equal(result,c(3/7,2/7,2/7))

})

#Reference BERTINI, GAMBARELLI, STACH 
#A Public Help Index (Theta)
test_that("Check 20.2 - publicHelpIndex",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(0,0,0,0,1,1,0,0,0,0,1,1,1,0,1)
  result=publicHelpIndex(v)
  expect_equal(result,c(6/17,4/17,4/17,3/17))
})

# An example motivated by German politics 
test_that("Check 20.3 - publicHelpIndex",{
  if(boolSkip){
    skip("Test was skipped")
  }
  
  v=weightedVotingGameVector(n=4,w=c(309,193,63,64),q=315)
  result=publicHelpIndex(v)
  expect_equal(result,c(7/22,5/22,5/22,5/22))
  
  v=weightedVotingGameVector(n=5,w=c(309,193,63,64,1),q=316)
  result=publicHelpIndex(v)
  expect_equal(result,c(14/52,10/52,10/52,10/52,8/52),tolerance=1e-3)
  
})

