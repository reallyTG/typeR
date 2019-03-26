context("enumeration")

test_that("enumeration", {
  lambda <- c(5,2,1)
  tableaux <- all_sytx(lambda)
  expect_length(tableaux, count_sytx(lambda))
  expect_identical(tableaux[[1]], firstsyt(lambda))
  expect_identical(tableaux[[2]], nextsyt(firstsyt(lambda)))
  expect_true(.islastsyt(tableaux[[length(tableaux)]]))
})
