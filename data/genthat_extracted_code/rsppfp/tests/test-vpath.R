context("VPath Translation")

library("rsppfp")



test_that("Correct transformation", {
  data.1 <- c("c", "c|u", "c|u|p", "e", "r", "r|t", "r|t|i", "n", "n|o")
  expected.1 <- c("c", "u", "p", "e", "r", "t", "i", "n", "o")
  expect_equal(parse_vpath(data.1), expected.1)

  data.2 <- c("27", "5", "19", "19|85", "19|85|88", "58", "58|63")
  expected.2 <- c("27", "5", "19", "85", "88", "58", "63")
  expect_equal(parse_vpath(data.2), expected.2 )

  data.3 <- c("789", "546", "123", "456")
  expect_equal(parse_vpath(data.3), data.3)

  data.3 <- list(27, 5, 19, "19|85", "19|85|88", 58, "58|63")
  expected.2 <- c("27", "5", "19", "85", "88", "58", "63")
  expect_equal(parse_vpath(data.2), expected.2 )
})



test_that("Transforming vectors of different data type", {
  data.1 <- c(TRUE, FALSE, TRUE, TRUE, TRUE, FALSE)
  expect_type(parse_vpath(data.1), "character")

  data.2 <- vpath.notChar.int <- c(789, 123, 156, 145, 178, 895)
  expect_type(parse_vpath(data.2), "character")
})



test_that("Single values and others", {
  expect_equal(parse_vpath(FALSE), "FALSE")
  expect_equal(parse_vpath(12345789), "12345789")
  expect_equal(parse_vpath(0.2), "0.2")
})
