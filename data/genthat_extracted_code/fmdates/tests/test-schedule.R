context("Schedule generator")

suppressPackageStartupMessages(library(lubridate))

test_that("Schedule generator works:", {
  # Start test
  d1 <- ymd(20120103)
  d2 <- ymd(20121203)
  s <- generate_schedule(d1, d2, months(3), AUSYCalendar(), "mf",
    "short_front", FALSE)
  res <- ymd(20120103, 20120305, 20120604, 20120903, 20121203, tz = "UTC")
  expect_identical(int_start(s), utils::head(res, -1))
  expect_identical(int_end(s), utils::tail(res, -1))

  # Change effective date
  d1 <- ymd(20120116)
  s <- generate_schedule(d1, d2, months(3), AUSYCalendar(), "mf",
    "short_front", FALSE)
  res <- ymd(20120116, 20120305, 20120604, 20120903, 20121203, tz = "UTC")
  expect_identical(int_start(s), utils::head(res, -1))
  expect_identical(int_end(s), utils::tail(res, -1))

  # Change direction
  s <- generate_schedule(d1, d2, months(3), AUSYCalendar(), "mf",
    "short_back", FALSE)
  res <- ymd(20120116, 20120416, 20120716, 20121016, 20121203, tz = "UTC")
  expect_identical(int_start(s), utils::head(res, -1))
  expect_identical(int_end(s), utils::tail(res, -1))

  # Change effective date
  d1 <- ymd(20111130)
  s <- generate_schedule(d1, d2, months(3), AUSYCalendar(), "mf",
    "short_back", FALSE)
  res <- ymd(20111130, 20120229, 20120530, 20120830, 20121130, 20121203,
    tz = "UTC")
  expect_identical(int_start(s), utils::head(res, -1))
  expect_identical(int_end(s), utils::tail(res, -1))

  # Change day conventiom
  s <- generate_schedule(d1, d2, months(3), AUSYCalendar(), "u",
    "short_back", FALSE)
  res <- ymd(20111130, 20120229, 20120530, 20120830, 20121130, 20121203,
    tz = "UTC")
  expect_identical(int_start(s), utils::head(res, -1))
  expect_identical(int_end(s), utils::tail(res, -1))

  # Change EOM rule
  s <- generate_schedule(d1, d2, months(3), AUSYCalendar(), "u",
    "short_back", TRUE)
  res <- ymd(20111130, 20120229, 20120531, 20120831, 20121130, 20121203,
    tz = "UTC")
  expect_identical(int_start(s), utils::head(res, -1))
  expect_identical(int_end(s), utils::tail(res, -1))

  # Change termination date
  d2 <- ymd(20121230)
  s <- generate_schedule(d1, d2, months(3), AUSYCalendar(), "u",
    "short_back", TRUE)
  res <- ymd(20111130, 20120229, 20120531, 20120831, 20121130, 20121230,
    tz = "UTC")
  expect_identical(int_start(s), utils::head(res, -1))
  expect_identical(int_end(s), utils::tail(res, -1))

  # Change stub type to long
  s <- generate_schedule(d1, d2, months(3), AUSYCalendar(), "u",
    "long_back", TRUE)
  res <- ymd(20111130, 20120229, 20120531, 20120831, 20121230, tz = "UTC")
  expect_identical(int_start(s), utils::head(res, -1))
  expect_identical(int_end(s), utils::tail(res, -1))

  # Change stub type to long front
  d1 <- ymd(20120103)
  d2 <- ymd(20121203)
  s <- generate_schedule(d1, d2, months(3), AUSYCalendar(), "mf",
    "long_front", FALSE)
  res <- ymd(20120103, 20120604, 20120903, 20121203, tz = "UTC")
  expect_identical(int_start(s), utils::head(res, -1))
  expect_identical(int_end(s), utils::tail(res, -1))
})
