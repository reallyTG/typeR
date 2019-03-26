context("test-ubci_get_options")

test_that("crypto chk", {
  tem <- ubci_get_options()
  expect_equal(tem$code[1], "UPBIT.KRW-BTC")
})

test_that("get colume chk", {
  tem <- ubci_get_options()
  col <- c("code","name","exchange","tradeStatus", "marketState")
  expect_equal(names(tem), col)
})

test_that("lang ko chk", {
  tem <- ubci_get_options("ko")
  expect_equal(nchar(tem$name[1]), 4)
})
