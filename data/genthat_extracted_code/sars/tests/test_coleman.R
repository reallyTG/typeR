context("coleman")

test_that("coleman main returns correct results", {
  data(cole_sim)
  fit <- coleman(cole_sim[[1]], cole_sim[[2]])
  expect_equal(round(sum(fit$Predicted_values), 2), 99.60)
  expect_output(str(fit), "List of 4")
  expect_is(fit, "coleman")
})
