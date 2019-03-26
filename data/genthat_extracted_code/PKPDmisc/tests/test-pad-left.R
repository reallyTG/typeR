context("left-padding")


test_that("left padding works", {
  expect_equal(pad_left(1, 3), "001")
  expect_equal(pad_left(c(1, 10, 100), 3), c("001", "010", "100" ))
  expect_equal(pad_left(c(1, 10, 1000), 3), c("001", "010", "1000" ))
  expect_equal(pad_left(c(1, 10), 4, "Z"), c("ZZZ1", "ZZ10"))
})