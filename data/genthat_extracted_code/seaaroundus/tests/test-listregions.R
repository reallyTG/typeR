context("listregions")

test_that("listregions works", {
  skip_on_cran()

  tt <- listregions("eez")

  expect_is(tt, "data.frame")
  expect_named(tt, c('title', 'id'))
  expect_is(tt$title, "character")
})

test_that("listregions fails well", {
  expect_error(listregions(), "argument \"region\" is missing")
})
