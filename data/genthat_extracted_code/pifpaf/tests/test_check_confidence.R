context("Check confidence")

test_that("Checking check_confidence",{
  
  #Check that for positive values of meancft and meanrr gives TRUE
  expect_error({
    check.confidence(-1)
  })
  
  expect_true({
    confidence <- runif(1, 0, 100)
    check.confidence(confidence)
    })
  
})