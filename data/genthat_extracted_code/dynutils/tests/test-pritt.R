context("Testing pritt")

test_that("Tibble helpers", {
  a <- 1
  b <- 2
  c <- "zzz"
  d <- 7L
  e <- 6.5

  o <- pritt("{a} {b} {c} {d} {e}")

  expect_equal(o, "1 2 zzz 7 6.5")
  expect_is(o, "character")
})
