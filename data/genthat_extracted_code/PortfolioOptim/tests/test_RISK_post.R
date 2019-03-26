test_that("Input",{
  expect_error(.RISK_post())
  expect_error(.RISK_post(returns,prob))
  expect_error(.RISK_post(alpha))
})

test_that("Output",{
  expect_true(is.list(.RISK_post(returns=c(2,3,1,1),prob=c(0.25,0.25,0.25,0.25),alpha=0.90)))
})
