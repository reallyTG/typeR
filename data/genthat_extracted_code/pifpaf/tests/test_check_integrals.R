context("Check integrals")

test_that("Checking check_integrals",{
  
  #Check that for positive values of meancft and meanrr gives TRUE
  expect_true({
    meancft <- 3
    meanrr  <- 4
    check.integrals(meanrr, meancft)
  })
  
  #Check that for negative values of meancft or meanrr an error arises
  expect_warning({
    meancft <- -3
    meanrr  <- 4
    check.integrals(meanrr, meancft)
  })
  
  expect_warning({
    meancft <- 3
    meanrr  <- -4
    check.integrals(meanrr, meancft)
  })
  
  #Check warning 
  expect_warning({
    meancft <- 3
    meanrr  <- 2
    check.integrals(meanrr, meancft)
  })
  
  
})