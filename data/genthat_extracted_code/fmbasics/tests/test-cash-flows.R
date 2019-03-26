context("CashFlow")

test_that("CashFlow creation works:", {
  mcm <- MultiCurrencyMoney(list(SingleCurrencyMoney(1, AUD())))
  expect_error(CashFlow(as.Date("2017-11-15"), mcm), NA)
  expect_error(CashFlow(as.Date(c("2017-11-15", "2017-11-16")), mcm))
  mcm <- MultiCurrencyMoney(list(
    SingleCurrencyMoney(1, AUD()),
    SingleCurrencyMoney(2, USD())
  ))
  expect_error(CashFlow(as.Date(c("2017-11-15", "2017-11-16")), mcm), NA)
})

test_that("CashFlow assertion works:", {
  expect_true(is.CashFlow(CashFlow(as.Date("2017-11-15"),
      MultiCurrencyMoney(list(SingleCurrencyMoney(1, AUD()))))
  ))
})

test_that("Tibbling works:", {
  expect_is(as_tibble(CashFlow(as.Date("2017-11-15"),
      MultiCurrencyMoney(list(SingleCurrencyMoney(1, AUD()))))), "tbl_df")
})