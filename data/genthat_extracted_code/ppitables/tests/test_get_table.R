library(ppitables)
context("Get PPI tables")

test_that("output is a tibble", {
  expect_is(get_table(), "tbl_df")
})

test_that("output has correct number of observations", {
  expect_equal(nrow(get_table(region = "Asia")), 19493)
  expect_true(is.null(get_table(region = "asia")))
  expect_equal(nrow(get_table(region = "Asia", country = "Nepal")), 1111)
  expect_true(is.null(get_table(region = "Asia", country = "nepal")))
})


test_that("produces error", {
  expect_warning(get_table(region = "asia"),
                 "asia not in the list of regions with PPI tables. Check region name spelling and/or check that asia is in the list of regions with PPI tables. Returning NULL results for asia")
})

test_that("produces error", {
  expect_warning(get_table(region = "Asia", country = "philippines"),
                 "philippines not in the list of countries with PPI tables. Check country name spelling and/or check that philippines is in the list of countries with PPI tables. Returning NULL results for philippines")
})

test_that("produces error", {
  expect_warning(get_table(region = "Asia", country = "Nepal", type = "ipa"),
                 "ipa not in the list of calculation types for the given country/ies. Check type ipa is in the list of calculation types for the given country/ies. Returning NULL results for type ipa")
})
