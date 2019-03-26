context("zb_id")

test_that("high level works", {
  vcr::use_cassette("zb_id_high_level", {
    aa <- zb_id(id = "6EA8BB2A-A57B-47C1-953E-042D8CD8E0E2")

    expect_is(aa, "data.frame")
    expect_is(aa, "tbl_df")
    expect_is(aa$identifier, 'character')
    expect_is(aa$abbreviation, 'character')
    expect_is(aa$identifierurl, 'character')
  })
})


test_that("high level works - not parsing", {
  skip_on_cran()

  vcr::use_cassette("zb_id_not_parsing", {
    aa <- zb_id(id = "6EA8BB2A-A57B-47C1-953E-042D8CD8E0E2", parse = FALSE)

    expect_is(aa, "list")
    expect_equal(length(aa), 3)
    expect_gt(length(aa[[1]]), 1)
    expect_is(aa[[1]]$Abbreviation, 'character')
  })
})

test_that("low level works", {
  skip_on_cran()

  library("jsonlite")

  vcr::use_cassette("zb_id_low_level", {
    aa <- zb_id_(id = "6EA8BB2A-A57B-47C1-953E-042D8CD8E0E2")
    aajson <- jsonlite::fromJSON(aa)

    expect_is(aa, "character")
    expect_is(aajson, "data.frame")
    expect_equal(NROW(aajson), 3)
  })
})

test_that("no results", {
  skip_on_cran()

  expect_equal(NROW(zb_id('asdfad')), 0)
})

test_that("fails well", {
  skip_on_cran()

  expect_error(zb_id(5), "id must be of class character")
  expect_error(zb_id(id = 5), "id must be of class character")
  expect_error(zb_id(5, 5), "parse must be of class logical")
})
