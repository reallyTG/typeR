context("%:%")

test_that("Lower case forward sequences work", {
  expect_equal("b" %:% "t", letters[2:20])
})

test_that("Upper case forward sequences work", {
  expect_equal("B" %:% "T", LETTERS[2:20])
})

test_that("Lower case reverse sequences work", {
  expect_equal("t" %:% "b", letters[20:2])
})

test_that("Upper case reverse sequences work", {
  expect_equal("T" %:% "B", LETTERS[20:2])
})

test_that("Mixed string sequencing fails", {
  expect_error("T" %:% "b", "letters must be of the same case")
})

