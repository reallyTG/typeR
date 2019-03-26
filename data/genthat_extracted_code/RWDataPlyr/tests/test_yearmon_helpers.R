library(RWDataPlyr)
library(zoo)


context("check ym_get_wateryear")

# ym_get_wateryear dimensions ----------------------
test_that("dimensions are correct", {
  expect_equal(length(ym_get_wateryear(as.yearmon("Dec 1999"))), 1)
  expect_equal(length(ym_get_wateryear(as.yearmon(2000 + seq(0, 23)/12))), 24)
  expect_null(dim(ym_get_wateryear(as.yearmon(2000 + seq(0, 11)/12))))
})

# ym_get_wateryear computes ------------------------
test_that("WY is computed as expected", {
  expect_equal(ym_get_wateryear(as.yearmon("Dec 1999")), 2000)
  expect_equal(
    ym_get_wateryear(as.yearmon(c("Dec 1999", "Jan 2000", "Dec 2000"))), 
    c(2000, 2000, 2001)
  )
  expect_equal(ym_get_wateryear(as.yearmon(2000 + seq(0, 23)/12)), 
               c(rep(2000, 9), rep(2001, 12), rep(2002, 3)))
})

# ym_get_wateryear errors and warnings ----------------
test_that("warnings and errors post correctly", {
  expect_warning(
    ym_get_wateryear("2000-11"), 
    "ym, is not a yearmon object. attempting to convert to yearmon..."
  )
  expect_warning(
    ym_get_wateryear("Feb 1977"),
    "ym, is not a yearmon object. attempting to convert to yearmon..."
  )
  expect_warning(expect_error(
    ym_get_wateryear("abc"), 
    "could not convert ym to yearmon"
  ))
  expect_warning(expect_error(
    ym_get_wateryear("20000118"), 
    "could not convert ym to yearmon"
  ))
})

# ym_get_wateryear vs getWYFromYearmon ----------------
test_that("`ym_get_wateryear() matches `getWYFromYearMon()`", {
  expect_identical(
    ym_get_wateryear(as.yearmon("Dec 1999")),
    expect_warning(getWYFromYearmon(as.yearmon("Dec 1999")))
  )
  expect_identical(
    ym_get_wateryear(as.yearmon(c("Dec 1999", "Jan 2000", "Dec 2000"))),
    expect_warning(
      getWYFromYearmon(as.yearmon(c("Dec 1999", "Jan 2000", "Dec 2000")))
    )
  )
})

# ym_get_year returns correctly -------------
context("check ym_get_year")

ym <- as.yearmon(c("Dec 1999", "Jan 2000", "Mar 2000"))

test_that("ym_get_year works", {
  # works with vector > 1
  expect_type(RWDataPlyr:::ym_get_year(ym), "double") %>%
    expect_length(3) %>%
    expect_equal(c(1999, 2000, 2000))
  
  # works with vector == 1
  expect_type(RWDataPlyr:::ym_get_year(ym[1]), "double") %>%
    expect_length(1) %>%
    expect_equal(1999)
})

# ym_get_year stops correctly ---------------
yerror <- "ym in ym_get_year(ym) is not a yearmon object."
test_that("ym_get_year errors as expected", {
  expect_error(RWDataPlyr:::ym_get_year("Dec 1999"), yerror, fixed = TRUE)
  expect_error(
    RWDataPlyr:::ym_get_year(c("Dec 1999", "Jan 2000")), 
    yerror, 
    fixed = TRUE
  )
  expect_error(RWDataPlyr:::ym_get_year(1), yerror, fixed = TRUE)
  expect_error(RWDataPlyr:::ym_get_year(as.numeric(ym)), yerror, fixed = TRUE)
})

context("check ym_get_month_str")

# ym_get_year returns correctly -------------
test_that("ym_get_year works", {
  # works with vector > 1
  expect_type(RWDataPlyr:::ym_get_month_str(ym), "character") %>%
    expect_length(3) %>%
    expect_equal(month.name[c(12, 1, 3)])
  
  # works with vector == 1
  expect_type(RWDataPlyr:::ym_get_month_str(ym[1]), "character") %>%
    expect_length(1) %>%
    expect_equal("December")
})

# ym_get_year stops correctly ---------------
yerror <- "ym in ym_get_month_str(ym) is not a yearmon object."
test_that("ym_get_year errors as expected", {
  expect_error(RWDataPlyr:::ym_get_month_str("Dec 1999"), yerror, fixed = TRUE)
  expect_error(
    RWDataPlyr:::ym_get_month_str(c("Dec 1999", "Jan 2000")), 
    yerror, 
    fixed = TRUE
  )
  expect_error(RWDataPlyr:::ym_get_month_str(1), yerror, fixed = TRUE)
  expect_error(
    RWDataPlyr:::ym_get_month_str(as.numeric(ym)), 
    yerror, 
    fixed = TRUE
  )
})
