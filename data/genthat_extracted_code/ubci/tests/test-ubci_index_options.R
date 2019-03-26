context("test-ubci_index_options")

test_that("index chk", {
  tem <- ubci_index_options()
  expect_equal(tem$index[1], "UBMI")
})

test_that("index colume chk", {
  tem <- ubci_index_options()
  col <- c("index","name","cate","smry")
  expect_equal(names(tem), col)
})

test_that("lang ko chk", {
  tem <- ubci_index_options("ko")
  expect_gt(nchar(tem$smry[7]), 50)
})
