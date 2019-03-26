boolSkip=F

test_that("Check 44.1 - check costSharingGameValue on appartment game for 3 players" ,{

  if(boolSkip){
    skip("Test was skipped")
  }
  
  C=c(300,270,280,410,410,410,550)
  expect_equal(0,costSharingGameValue(S = c(1),C))
  expect_equal(0,costSharingGameValue(S = c(2),C))
  expect_equal(0,costSharingGameValue(S = c(3),C))
  expect_equal(160,costSharingGameValue(S = c(1,2),C))
  expect_equal(170,costSharingGameValue(S = c(1,3),C))
  expect_equal(140,costSharingGameValue(S = c(2,3),C))
  expect_equal(300,costSharingGameValue(S = c(1,2,3),C))
})


test_that("Check 44.2 - check costSharingGameValue on appartment game for 3 players" ,{

  if(boolSkip){
    skip("Test was skipped")
  }
  
  C=c(300,270,280,410,410,410,550)
  expectedA=c(0,0,0,160,170,140,300)
  actualA=costSharingGameVector(n=3, C)
  expect_equivalent(actualA,expectedA)
})

