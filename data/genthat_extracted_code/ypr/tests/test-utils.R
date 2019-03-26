context("utils")

test_that("ypr_inst2inter", {
  expect_equal(ypr_inst2inter(ypr_inter2inst(0.5)), 0.5)
})
