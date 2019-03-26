context("Money")

test_that("SingleCurrencyMoney created:", {
  expect_error(SingleCurrencyMoney(1, AUD()), NA)
  expect_error(SingleCurrencyMoney(1:2, AUD()), NA)
  expect_error(SingleCurrencyMoney(1, list(AUD())))
})

test_that("SingleCurrencyMoney iso is correct:", {
  expect_equal(iso(SingleCurrencyMoney(1, AUD())), "AUD")
})

test_that("SingleCurrencyMoney assertion works:", {
  expect_true(is.SingleCurrencyMoney(SingleCurrencyMoney(1, AUD())))
  expect_false(is.SingleCurrencyMoney(
    MultiCurrencyMoney(list(SingleCurrencyMoney(1, AUD()))))
  )
})

test_that("SingleCurrencyMoney concatenation works:", {
  expect_is(c(SingleCurrencyMoney(1, AUD()), SingleCurrencyMoney(1, USD())),
    "MultiCurrencyMoney")
  expect_error(c(SingleCurrencyMoney(1, AUD()),
    MultiCurrencyMoney(list(SingleCurrencyMoney(1, AUD())))))
})

test_that("MultiCurrencyMoney created:", {
  expect_error(MultiCurrencyMoney(list(
    SingleCurrencyMoney(1, AUD()))), NA)
  expect_error(MultiCurrencyMoney(1, AUD()))
  expect_error(MultiCurrencyMoney(SingleCurrencyMoney(1, AUD())))
})

test_that("MultiCurrencyMoney assertion works:", {
  expect_false(is.MultiCurrencyMoney(SingleCurrencyMoney(1, AUD())))
  expect_true(is.MultiCurrencyMoney(MultiCurrencyMoney(
    list(SingleCurrencyMoney(1, AUD()))))
  )
})