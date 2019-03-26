context("zb_matching")

test_that("high level works", {
  vcr::use_cassette("zb_matching_high_level", {
    aa <- zb_matching(id = "FFF7160A-372D-40E9-9611-23AF5D9EAC4C")

    expect_is(aa, "data.frame")
    expect_is(aa, "tbl_df")
    expect_is(aa$fullnamestring, 'character')
    expect_type(aa$nomenclaturalcodeid, 'integer')
    expect_is(aa$taxonrank, 'character')
    expect_type(aa$synonymtype, 'integer')
    expect_is(aa$referencecount, 'integer')
  })
})

test_that("high level works - not parsing", {
  skip_on_cran()

  vcr::use_cassette("zb_matching_not_parsing", {
    aa <- zb_matching(id = "FFF7160A-372D-40E9-9611-23AF5D9EAC4C", parse = FALSE)

    expect_is(aa, "list")
    expect_equal(length(aa), 3)
    expect_is(length(aa[[1]]), 'integer')
    expect_is(aa$DATA$FullNameString, 'list')
    expect_is(aa$DATA$FullNameString[[1]], 'character')
  })
})

test_that("low level works", {
  skip_on_cran()

  library("jsonlite")

  vcr::use_cassette("zb_matching_low_level", {
    aa <- zb_matching_(id = "FFF7160A-372D-40E9-9611-23AF5D9EAC4C")
    aajson <- jsonlite::fromJSON(aa)

    expect_is(aa, "character")
    expect_is(aajson, "list")
  })
})

test_that("no results", {
  skip_on_cran()

  expect_error(zb_matching('asdfad'), "Internal Server Error")
})

test_that("fails well", {
  skip_on_cran()

  expect_error(zb_matching(5), "id must be of class character")
  expect_error(zb_matching(5, 5), "parse must be of class logical")
})
