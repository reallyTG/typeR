context("zb_name_usages")

test_that("high level works - parsing", {
  vcr::use_cassette("zb_name_usages", {
    aa <- zb_name_usages(name = "Pseudanthias carlsoni")

    expect_is(aa, "data.frame")
    expect_is(aa, "tbl_df")
    expect_is(aa$namestring, 'character')
    expect_equal(aa$namestring, 'carlsoni')
  })
})


test_that("high level works - not parsing", {
  skip_on_cran()

  vcr::use_cassette("zb_name_usages_not_parsing", {
    aa <- zb_name_usages(name = "Pseudanthias carlsoni", parse = FALSE)

    expect_is(aa, "list")
    expect_equal(length(aa), 1)
    expect_gt(length(aa[[1]]), 1)
    expect_is(aa[[1]]$namestring, 'character')
    expect_equal(aa[[1]]$namestring, 'carlsoni')
  })
})

test_that("low level works", {
  skip_on_cran()

  library("jsonlite")

  vcr::use_cassette("zb_name_usages_low_level", {
    aa <- zb_name_usages_(name = "Pseudanthias carlsoni")
    aajson <- jsonlite::fromJSON(aa)

    expect_is(aa, "character")
    expect_is(aajson, "data.frame")
    expect_equal(NROW(aajson), 1)
  })
})

test_that("no results", {
  skip_on_cran()

  expect_error(zb_name_usages('asdfad'), "Not Found")
})

test_that("fails well", {
  skip_on_cran()

  expect_error(zb_name_usages(5), "name must be of class character")
  expect_error(zb_name_usages(id = 5), "id must be of class character")
  expect_error(zb_name_usages(query = 5), "query must be of class character")
})
