context("Rates")
library("lubridate")

test_that("Constructor works", {
  rate <- InterestRate(c(0.03, 0.04, 0.05), c(0, Inf), 'act/365')
  expect_equal(rate$value, c(0.03, 0.04, 0.05))
  expect_equal(rate$compounding, c(0, Inf, 0))
  expect_equal(rate$day_basis, c('act/365', 'act/365', 'act/365'))
  rate <- InterestRate(0.03, c(0, Inf), c('act/365', 'act/360', '30e/360'))
  expect_equal(rate$value, rep(0.03, 3))
  expect_equal(rate$compounding, c(0, Inf, 0))
  expect_equal(rate$day_basis, c('act/365', 'act/360', '30e/360'))
})

test_that("as_DiscountFactor method works", {
  rate <- InterestRate(0.04, 0, "act/360")
  expect_equal(as_DiscountFactor(rate, ymd("20100101"), ymd("20150101"))$value,
    0.831331978570109, tolerance=1e20)
  rate <- InterestRate(0.075, Inf, "act/365")
  expect_equal(as_DiscountFactor(rate, ymd("20100101"), ymd("20150101"))$value,
    0.687148069474866, tolerance=1e20)
  rate <- InterestRate(0.01, 4, "30/360us")
  expect_equal(as_DiscountFactor(rate, ymd("20100101"), ymd("20150101"))$value,
    0.951288779290496, tolerance=1e20)
  rate <- InterestRate(0.01, -1, "30/360us")
  expect_equal(as_DiscountFactor(rate, ymd("20100101"), ymd("20100330"))$value,
    0.997527777777778, tolerance=1e20)
})

test_that("convert method works", {
  rate <- InterestRate(0.04, 0, "act/360")
  rate_new <- as_InterestRate(rate, Inf, "act/360")
  expect_equal(rate_new$value, 0.0364191596790165, tolerance=1e20)
  rate_new <- as_InterestRate(rate, 4, "act/360")
  expect_equal(rate_new$value, 0.0365854583997862, tolerance=1e20)
  rate_new <- as_InterestRate(rate, 4, "act/365")
  expect_equal(rate_new$value, 0.0370959387671626, tolerance=1e20)
})

test_that("Other rate methods work", {
  expect_equal(as.numeric(InterestRate(0.04, 0, "act/360")), 0.04)
})

context("DiscountFactor")

test_that("Constructor works", {
  dfs <- DiscountFactor(c(0.95, 0.94, 0.93), ymd(20130101),
    ymd(20140101, 20150101))
  expect_equal(dfs$value, c(0.95, 0.94, 0.93))
  expect_equal(dfs$start_date, rep(ymd(20130101), 3))
  expect_equal(dfs$end_date, ymd(20140101, 20150101, 20140101))
  expect_true(is.DiscountFactor(dfs))
})

test_that("to_rate method works", {
  df <- DiscountFactor(0.95, ymd("20100101"), ymd("20150101"))
  expect_equal(as_InterestRate(df, 2, "act/365")$value, 0.0102793669522563, tolerance=1e20)
  df <- DiscountFactor(0.95, ymd("20100101"), ymd("20150101"))
  expect_equal(as_InterestRate(df, Inf, "act/365")$value, 0.010253040772977, tolerance=1e20)
  df <- DiscountFactor(0.95, ymd("20100101"), ymd("20100330"))
  expect_equal(as_InterestRate(df, -1, "30/360us")$value, 0.202247191011236, tolerance=1e20)
})

test_that("Other discount factor methods work", {
  expect_equal(as.numeric(DiscountFactor(0.95, ymd("20100101"), ymd("20150101"))), 0.95)
})

context('Rate ops')

test_that('c() works', {
  rate1 <- InterestRate(0.04, 2, 'act/365')
  rate2 <- InterestRate(0.035, 4, 'act/360')
  rates <- InterestRate(c(0.04, 0.035), c(2, 4), c('act/365', 'act/360'))
  expect_equal(c(rate1, rate2), rates)
})

test_that("c() works for lists", {
  rates1 <- c(InterestRate(0.04, 2, 'act/365'),
    InterestRate(0.05, 2, 'act/365'))
  rates2 <- InterestRate(0.035, 4, 'act/360')
  rates <- InterestRate(c(0.04, 0.05, 0.035), c(2, 2, 4),
    c('act/365', 'act/365', 'act/360'))
  expect_equal(c(rates1, rates2), rates)
})

test_that('[ works', {
  rate1 <- InterestRate(0.04, 2, 'act/365')
  rate2 <- InterestRate(0.035, 4, 'act/360')
  rates <- c(rate1, rate2)
  expect_equal(rates[1], rate1)
  expect_equal(rates[2], rate2)
  expect_equal(rates[c(FALSE, TRUE)], rate2)
})

test_that('[<- works', {
  rate1 <- InterestRate(0.04, 2, 'act/365')
  rate2 <- InterestRate(0.035, 4, 'act/360')
  rates <- c(rate1, rate2)
  rates[1] <- rate2
  expect_equal(rates, c(rate2, rate2))
  rates[c(FALSE, TRUE)] <- rate1
  expect_equal(rates, c(rate2, rate1))
})

test_that('rep works',  {
  rate1 <- InterestRate(0.04, 2, 'act/365')
  rates <- rep(rate1, 2)
  expect_equal(rates, c(rate1, rate1))
})

test_that('Addition (and subtraction) works',  {
  rate1 <- InterestRate(0.04, 2, 'act/365')
  rate2 <- InterestRate(0.035, 4, 'act/360')
  rates <- c(rate1, rate2)
  result <- InterestRate(c(0.05, 0.045), c(2, 4), c('act/365', 'act/360'))
  expect_equal(rates + 0.01, result)
  result <- InterestRate(c(0.05, 0.06), c(2, 2), c('act/365', 'act/365'))
  expect_equal(rate1 + c(0.01, 0.02), result)
  result <- InterestRate(0.08, 2, 'act/365')
  expect_equal(rate1 + rate1, result)
})

test_that('Multiplication works',  {
  rate1 <- InterestRate(0.04, 2, 'act/365')
  expect_equal(rate1 * 0.5, InterestRate(0.02, 2, 'act/365'))
  rate2 <- InterestRate(0.01, 2, 'act/365')
  expect_equal(rate1 * rate2, InterestRate(4e-4, 2, 'act/365'))
})

test_that('Division works', {
  rate1 <- InterestRate(0.04, 2, 'act/365')
  expect_equal(rate1 / 2, InterestRate(0.02, 2, 'act/365'))
  rate2 <- InterestRate(0.01, 2, 'act/365')
  expect_equal(rate1 / rate2, InterestRate(4, 2, 'act/365'))
})

test_that('Comparison ops works', {
  rate1 <- InterestRate(0.04, 2, 'act/365')
  rate2 <- InterestRate(0.01, 2, 'act/365')
  expect_false(rate1 == rate2)
  expect_true(rate1 == rate1)
  expect_false(rate1 < rate2)
  expect_true(rate1 > rate2)
  expect_true(rate1 >= rate2)
  expect_true(rate1 >= rate1)
})

context('DiscountFactor ops')

test_that('c() works as expected', {
  df1 <- DiscountFactor(0.99, ymd(20130101), ymd(20140101))
  df2 <- DiscountFactor(0.97, ymd(20130101), ymd(20150101))
  result <- DiscountFactor(c(0.99, 0.97), ymd(20130101, 20130101),
    ymd(20140101, 20150101))
  expect_equal(c(df1, df2), result)
})

test_that('[ works as expected', {
  df1 <- DiscountFactor(0.99, ymd(20130101), ymd(20140101))
  df2 <- DiscountFactor(0.97, ymd(20130101), ymd(20150101))
  dfs <- c(df1, df2)
  expect_equal(dfs[1], df1)
  expect_equal(dfs[c(FALSE, TRUE)], df2)
})

test_that('[<- works as expected', {
  df1 <- DiscountFactor(0.99, ymd(20130101), ymd(20140101))
  df2 <- DiscountFactor(0.97, ymd(20130101), ymd(20150101))
  dfs <- c(df1, df2)
  dfs[1] <- df2
  expect_equal(dfs, c(df2, df2))
})

test_that('rep works as expected', {
  df1 <- DiscountFactor(0.99, ymd(20130101), ymd(20140101))
  dfs <- c(df1, df1)
  expect_equal(rep(df1, 2), c(df1, df1))
})

test_that('length works as expected', {
  df1 <- DiscountFactor(0.99, ymd(20130101), ymd(20140101))
  dfs <- c(df1, df1)
  expect_equal(length(dfs), 2)
})

test_that('Multiplication works as expected', {
  df1 <- DiscountFactor(0.99, ymd(20130101, 20130201),
    ymd(20140101, 20140201))
  df2 <- DiscountFactor(0.99, ymd(20140101, 20140201),
    ymd(20150101, 20150201))
  result <- DiscountFactor(0.99 * 0.99, ymd(20130101, 20130201),
    ymd(20150101, 20150201))
  expect_equal(df1 * df2, result)
  expect_error(df1 * df1)
})

test_that('Division works as expected', {
  df1 <- DiscountFactor(0.99, ymd(20130101, 20130201),
    ymd(20140101, 20140201))
  df2 <- DiscountFactor(0.97, ymd(20130101, 20130201),
    ymd(20150101, 20150201))
  df3 <- DiscountFactor(0.99, ymd(20140101), ymd(20150101))
  result <- DiscountFactor(0.97 / 0.99, ymd(20140101, 20140201),
    ymd(20150101, 20150201))
  expect_equal(df2 / df1, result)
  expect_error(df3 / df2)
})

test_that("Comparisons work", {
  df1 <- DiscountFactor(0.99, ymd(20130101), ymd(20140101))
  df2 <- DiscountFactor(0.99, ymd(20130101), ymd(20150101))
  df3 <- DiscountFactor(0.98, ymd(20130101), ymd(20150101))
  expect_equal(df1, df1)
  expect_type(all.equal(df1, df2), "character")
  expect_true(df3 < df1)
  expect_true(df1 > df3)
})