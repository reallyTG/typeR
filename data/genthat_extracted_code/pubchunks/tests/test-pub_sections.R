context("pub_sections")

test_that("pub_sections works", {
  expect_is(pub_sections(), "character")
  expect_true(any(grepl("title", pub_sections())))
  expect_true(any(grepl("publisher", pub_sections())))
  expect_true(any(grepl("history", pub_sections())))
})

test_that("pub_sections fails well", {
  expect_error(pub_sections(5), "unused argument")
})
