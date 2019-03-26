context("zb_stats")

test_that("high level works", {
  vcr::use_cassette("zb_stats_high_level", {
    aa <- zb_stats(start_date = "2018-03-01", end_date = "2018-04-01")

    expect_is(aa, "data.frame")
    expect_is(aa, "tbl_df")
    expect_named(aa, c('identifierdomain', 'day', 'recordcount'))
    expect_is(aa$identifierdomain, 'character')
    expect_type(aa$day, 'character')
    expect_is(aa$recordcount, 'character')
  })
})

test_that("high level works - not parsing", {
  skip_on_cran()

  vcr::use_cassette("zb_stats_not_parsing", {
    aa <- zb_stats(start_date = "2018-03-01", end_date = "2018-04-01", 
      parse = FALSE)

    expect_is(aa, "list")
    expect_equal(length(aa), 2)
    expect_named(aa, c('columns', 'data'))
  })
})

test_that("low level works", {
  skip_on_cran()

  library("jsonlite")

  vcr::use_cassette("zb_stats_low_level", {
    aa <- zb_stats_(start_date = "2018-03-01", end_date = "2018-04-01", "day")
    aajson <- jsonlite::fromJSON(aa)

    expect_is(aa, "character")
    expect_is(aajson, "list")
    expect_named(aajson, c("columns", "data"))
    expect_is(aajson$columns, "character")
    expect_is(aajson$data, "matrix")
  })
})

test_that("fails well", {
  skip_on_cran()

  expect_error(zb_stats(5), "start_date must be of class Date, character")
  expect_error(zb_stats("2018-03-01", 5), 
    "end_date must be of class Date, character")
  expect_error(zb_stats("2018-03-01", "2018-03-01", 5), 
    "period must be of class character")
  expect_error(zb_stats_(), 
    "argument \"start_date\" is missing")
  expect_error(zb_stats_("2018-03-01"), 
    "argument \"end_date\" is missing")
  expect_error(zb_stats_("2018-03-01", "2018-03-01"), 
    "argument \"period\" is missing")
})
