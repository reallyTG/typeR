context("Pairup")

test_that("pairup works with default type open 'less'", {
  expect_equal(pairup(c(1, 2, 3, 4)), pairup.ww(c(1, 2, 3, 4)))
  
  expect_equal(pairup(c(4, 5, 6, 7)), pairup.ww(c(4, 5, 6, 7)))
})

test_that("pairup works with type 'neq", {
  expect_equal(pairup(c(1, 2, 3, 4), type='neq'), pairup.ww(c(1, 2, 3, 4), type='neq'))
})

test_that("pairup works with type 'leq", {
  expect_equal(pairup(c(1, 2, 3, 4), type='leq'), pairup.ww(c(1, 2, 3, 4), type='leq'))
})