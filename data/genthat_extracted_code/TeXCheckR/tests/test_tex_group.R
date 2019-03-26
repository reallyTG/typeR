context("tex_group_by_char")

test_that("Examples", {
  out <- tex_group_by_char("a{b}")[[1]]
  expect_equal(out, c(0, 1, 1, 0))
  out <- tex_group_by_char("a{bc}{d{e}}")[[1]]
  expect_equal(out, c(0, 1, 1, 1, 0, 1, 1, 2, 2, 1, 0))
})
