context("examples")

test_that("Example arguments to eply are produced.", {
  e <- example.expr()
  expect_true(is.data.frame(e))
  expect_true(all(dim(e) > 1))
  expect_equal(example.fun(6, 3), 2)
  expect_true(is.list(example.with()))
})
