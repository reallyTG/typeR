context("zb_publications")

test_that("high level works", {
  vcr::use_cassette("zb_publications_high_level", {
    aa <- zb_publications(id = "427D7953-E8FC-41E8-BEA7-8AE644E6DE77")

    expect_is(aa, "data.frame")
    expect_is(aa, "tbl_df")
    expect_is(aa$authorlist, 'character')
    expect_is(aa$label, 'character')
    expect_is(aa$value, 'character')
    expect_is(aa$year, 'character')
    expect_match(aa$value, 'Pyle')
    expect_equal(NROW(aa), 1)

    bb <- zb_publications(query = "pyle")

    expect_is(bb, "data.frame")
    expect_is(bb, "tbl_df")
    expect_is(bb$authorlist, 'character')
    expect_is(bb$label, 'character')
    expect_is(bb$value, 'character')
    expect_gt(NROW(bb), 1)
  }, preserve_exact_body_bytes = TRUE)
})


test_that("high level works - not parsing", {
  skip_on_cran()

  vcr::use_cassette("zb_publications_not_parsing", {
    aa <- zb_publications(id = "427D7953-E8FC-41E8-BEA7-8AE644E6DE77", parse = FALSE)

    expect_is(aa, "list")
    expect_equal(length(aa), 1)
    expect_gt(length(aa[[1]]), 1)
    expect_is(aa[[1]]$referencetype, 'character')
    expect_match(aa[[1]]$referencetype, 'Journal Article')
  })
})

test_that("low level works", {
  skip_on_cran()

  library("jsonlite")

  vcr::use_cassette("zb_publications_low_level", {
    aa <- zb_publications_(id = "427D7953-E8FC-41E8-BEA7-8AE644E6DE77", NULL)
    aajson <- jsonlite::fromJSON(aa)

    expect_is(aa, "character")
    expect_is(aajson, "data.frame")
    expect_equal(NROW(aajson), 1)
  })
})

test_that("fails well", {
  skip_on_cran()

  expect_error(zb_publications(5), "id must be of class character")
  expect_error(zb_publications(query = 5), "query must be of class character")
  expect_error(zb_publications('ads', 'foo', 5), "parse must be of class logical")
})
