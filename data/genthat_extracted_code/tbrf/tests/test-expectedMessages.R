context("core functions return expected errors and messages")
library(tbrf)

test_that("tbr_binom returns error", {
  df <- data.frame(
    date = sample(seq(as.Date('2000-01-01'), as.Date('2005/12/30'), by = "day"), 10),
    value = rbinom(10, 1, 0.25)
  )

  expect_error(df %>% tbr_binom(x = value,
                                   tcolumn = date,
                                   unit = "year",
                                   n = 5,
                                   alpha = 0.1),
                  "unit must be one of years, months, weeks, days, hours, minutes, seconds")
})


df <- data.frame(
  date = sample(seq(as.Date('2000-01-01'), as.Date('2005/12/30'), by = "day"), 10),
  value = rexp(10, 1/100)
)

test_that("tbr_gmean returns error", {

  expect_error(df %>% tbr_gmean(x = value,
                                   tcolumn = date,
                                   unit = "year",
                                   n = 5),
               "unit must be one of years, months, weeks, days, hours, minutes, seconds")
})

test_that("tbr_mean returns error", {

  expect_error(df %>% tbr_mean(x = value,
                                  tcolumn = date,
                                  unit = "year",
                                  n = 5),
                  "unit must be one of years, months, weeks, days, hours, minutes, seconds")
})

test_that("tbr_median returns error", {

  expect_error(df %>% tbr_median(x = value,
                                    tcolumn = date,
                                    unit = "year",
                                    n = 5),
               "unit must be one of years, months, weeks, days, hours, minutes, seconds")
})

test_that("tbr_sd returns error", {

  expect_error(df %>% tbr_sd(x = value,
                                tcolumn = date,
                                unit = "year",
                                n = 5),
                  "unit must be one of years, months, weeks, days, hours, minutes, seconds")
})

test_that("tbr_sum returns error", {

  expect_error(df %>% tbr_sum(x = value,
                                 tcolumn = date,
                                 unit = "year",
                                 n = 5),
                  "unit must be one of years, months, weeks, days, hours, minutes, seconds")
})


test_that("tbr_misc returns error", {

  expect_error(df %>% tbr_misc(x = value,
                              tcolumn = date,
                              unit = "year",
                              n = 5,
                              func = sum),
               "unit must be one of years, months, weeks, days, hours, minutes, seconds")
})
