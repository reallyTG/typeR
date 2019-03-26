context("test-ubci_get.R")

test_that("colume check", {
  tem <- ubci_get("UPBIT.KRW-BTC")
  col <- c("code","date","open","high","low","close","volume")
  expect_equal(names(tem), col)
})

test_that("code check", {
  expect<-ubci_get_options()$code[1]
  tem <- ubci_get(expect)
  code <- unique(tem$code)
  expect_equal(code, expect)
})

test_that("date check from", {
  chk <- tail(ubci_get("UPBIT.KRW-BTC", from = "2018-05-01"),1)$date
  expect_equal(chk, as.Date("2018-05-01"))
})

test_that("date check to", {
  chk <- head(ubci_get("UPBIT.KRW-BTC", to = "2018-05-01"),1)$date
  expect_equal(chk, as.Date("2018-05-01"))
})

