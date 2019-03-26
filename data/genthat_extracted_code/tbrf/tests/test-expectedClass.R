context("core functions work in piped workflow")
library(tbrf)

test_that("tbr_binom returns tbl_df in tidy chain", {
  df <- data.frame(
    date = sample(seq(as.Date('2000-01-01'), as.Date('2005/12/30'), by = "day"), 10),
    value = rbinom(10, 1, 0.25)
  )

  expect_s3_class(df %>% tbr_binom(x = value,
                                   tcolumn = date,
                                   unit = "years",
                                   n = 5,
                                   alpha = 0.1),
                  "tbl_df")
})

df <- data.frame(
  date = sample(seq(as.Date('2000-01-01'), as.Date('2005/12/30'), by = "day"), 10),
  value = rexp(10, 1/100)
)

test_that("tbr_gmean returns tbl_df in tidy chain", {

  expect_s3_class(df %>% tbr_gmean(x = value,
                                   tcolumn = date,
                                   unit = "years",
                                   n = 5),
                  "tbl_df")
})

test_that("tbr_mean returns tbl_df in tidy chain", {

  expect_s3_class(df %>% tbr_mean(x = value,
                                  tcolumn = date,
                                  unit = "years",
                                  n = 5),
                  "tbl_df")
})


test_that("tbr_sd returns tbl_df in tidy chain", {

  expect_s3_class(df %>% tbr_sd(x = value,
                                     tcolumn = date,
                                     unit = "years",
                                     n = 5),
                  "tbl_df")
})

test_that("tbr_sum returns tbl_df in tidy chain", {

  expect_s3_class(df %>% tbr_sum(x = value,
                                tcolumn = date,
                                unit = "years",
                                n = 5),
                  "tbl_df")
})


test_that("tbr_misc returns tbl_df in tidy chain", {

  expect_s3_class(df %>% tbr_misc(x = value,
                                 tcolumn = date,
                                 unit = "years",
                                 n = 5,
                                 func = sum),
                  "tbl_df")
})
