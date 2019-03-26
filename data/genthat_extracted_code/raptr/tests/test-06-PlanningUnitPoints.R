context("06-PlanningUnitPoints")

test_that("PlanningUnitPoints generator function", {
  # create object
  pups <- PlanningUnitPoints(matrix(runif(100), ncol = 2), ids = seq_len(50))
  # check object
  expect_is(pups, "PlanningUnitPoints")
  expect_equal(ncol(pups@coords), 2)
  expect_equal(nrow(pups@coords), 50)
})
