context("German tests")

test_that("toOrdinal correctly processes integers 0-20 in German", {
  first_20 <- c("0te", "1te", "2te", "3te", "4te", "5te", "6te", "7te", "8te",
                "9te", "10te", "11te", "12te", "13te", "14te", "15te", "16te",
                "17te", "18te", "19te", "20ste")
  using_toOrdinal <- sapply(0:20, "toOrdinal", "GERMAN")

  expect_equal(
    first_20, using_toOrdinal
  )
})

test_that("toOrdinal correctly errors when given a negative integer.",{

  expect_error(
    toOrdinal(-1, "GERMAN"), "Number supplied to 'toOrdinal' must be a non-negative integer."
  )
})
