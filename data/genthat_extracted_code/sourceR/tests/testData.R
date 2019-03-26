context("Testing data structures")

test_that("Test X", {
  src = sim_SA$sources
  obj = X(src, x='Count', source='Source', type='Type', time='Time')
  expect_equal_to_reference(obj$x, 'dataX.rds')
})

test_that("Prevalence", {
  expect_silent(Prev(sim_SA$prev, prev = 'Value', source='Source', time='Time'))
})
