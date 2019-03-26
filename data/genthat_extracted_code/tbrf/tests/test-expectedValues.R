context("core functions return expected structures and values")
library(tbrf)

df <- data.frame(
  date = sample(seq(as.Date('2000-01-01'), as.Date('2005/12/30'), by = "day"), 10),
  value = rexp(10, 1/100)
)


test_that("tbr_mean provides same results as mean", {

  x1 <- df %>% tbr_mean(x = value,
                       tcolumn = date,
                       unit = "years",
                       n = 5)
  expect_s3_class(x1, "tbl_df")

  x2 <- df %>% tbr_misc(x = value,
                        tcolumn = date,
                        unit = "years",
                        n = 5,
                        func = mean)
  expect_s3_class(x2, "tbl_df")

  expect_equal(sum(x1[10,3]), sum(x2[10,3]))
  })


test_that("tbr_median provides same results as mean", {

  x1 <- df %>% tbr_median(x = value,
                        tcolumn = date,
                        unit = "years",
                        n = 5)
  expect_s3_class(x1, "tbl_df")
  x2 <- df %>% tbr_misc(x = value,
                        tcolumn = date,
                        unit = "years",
                        n = 5,
                        func = median)
  expect_equal(sum(x1[10,3]), sum(x2[10,3]))
})


test_that("tbr_sum provides expected values", {

  df <- data.frame(
    date = (as.Date(c('2001-01-01', '2002-01-01',
                      '2003-01-01', '2004-01-01',
                      '2005-01-01', '2006-01-01',
                      '2007-01-01', '2008-01-01',
                      '2009-01-01', '2010-01-01'))),
    value = 1
  )

  x1 <- df %>% tbr_sum(x = value,
                          tcolumn = date,
                          unit = "years",
                          n = 5)

  expect_equal(sum(x1$sum), 40)
})

randomTimes <- function(n, st = "2012/01/01", et = "2012/01/02") {
  st <- as.POSIXct(as.Date(st))
  et <- as.POSIXct(as.Date(et))
  dt <- as.numeric(difftime(et,st,unit = "sec"))
  ev <- sort(runif(n, 0, dt))
  rt <- st + ev
  rt
}

test_that("core functions work with different time units", {
  df <- data.frame(
    date = randomTimes(100),
    value = rexp(100, 1/100)
  )

  expect_s3_class(df %>% tbr_mean(x = value,
                                  tcolumn = date,
                                  unit = "minutes",
                                  n = 60),
                  "tbl_df")

  expect_s3_class(df %>% tbr_misc(x = value,
                                  tcolumn = date,
                                  unit = "minutes",
                                  n = 60,
                                  func = mean),
                  "tbl_df")
})
