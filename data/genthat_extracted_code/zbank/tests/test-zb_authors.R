context("zb_authors")

test_that("high level works", {
  vcr::use_cassette("zb_authors_high_level", {
    aa <- zb_authors(id = "8C466CBE-3F7D-4DC9-8CBD-26DD3F57E212")

    expect_is(aa, "data.frame")
    expect_is(aa, "tbl_df")
    expect_is(aa$agentnameid, 'character')
    expect_is(aa$label, 'character')
    expect_is(aa$value, 'character')
    expect_match(aa$value, 'Pyle')
    expect_equal(NROW(aa), 1)

    bb <- zb_authors(query = "Schmutz")

    expect_is(bb, "data.frame")
    expect_is(bb, "tbl_df")
    expect_is(bb$agentnameid, 'character')
    expect_is(bb$label, 'character')
    expect_is(bb$value, 'character')
    expect_match(bb$value, 'Schmutz')
    expect_gt(NROW(bb), 1)
  })
})


test_that("high level works - not parsing", {
  skip_on_cran()

  vcr::use_cassette("zb_authors_not_parsing", {
    aa <- zb_authors(id = "8C466CBE-3F7D-4DC9-8CBD-26DD3F57E212", parse = FALSE)

    expect_is(aa, "list")
    expect_equal(length(aa), 1)
    expect_gt(length(aa[[1]]), 1)
    expect_is(aa[[1]]$agentnameid, 'character')
    expect_match(aa[[1]]$label, 'Pyle')
  })
})

test_that("low level works", {
  skip_on_cran()

  library("jsonlite")

  vcr::use_cassette("zb_authors_low_level", {
    aa <- zb_authors_(id = "8C466CBE-3F7D-4DC9-8CBD-26DD3F57E212")
    aajson <- jsonlite::fromJSON(aa)

    expect_is(aa, "character")
    expect_is(aajson, "data.frame")
    expect_equal(NROW(aajson), 1)
  })
})

test_that("no results", {
  skip_on_cran()

  expect_equal(NROW(zb_authors('asdfad')), 0)
})

test_that("fails well", {
  skip_on_cran()

  expect_error(zb_authors(5), "id must be of class character")
  expect_error(zb_authors(id = 5), "id must be of class character")
  expect_error(zb_authors(query = 5), "query must be of class character")
})
