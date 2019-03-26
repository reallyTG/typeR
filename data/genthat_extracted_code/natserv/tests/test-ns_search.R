context("ns_search")

test_that("ns_search works as expected", {
  skip_on_cran()

  vcr::use_cassette("ns_search", {
    aa <- ns_search(x = "Helianthus annuus")
  })

  expect_is(aa, 'tbl_df')
  expect_is(aa$globalSpeciesUid, 'character')
  expect_is(aa$jurisdictionScientificName, 'character')
  expect_is(aa$commonName, 'character')
  expect_is(aa$natureServeExplorerURI, 'character')

  expect_equal(aa$jurisdictionScientificName, 'Helianthus annuus')
})

test_that("ns_search fails well", {
  skip_on_cran()

  vcr::use_cassette("ns_search_error", {
    expect_error(ns_search("asdfasf"), 'no results found')
  })

  expect_error(ns_search(),
               'argument "x" is missing')

  # fails well when input not character
  expect_error(ns_search(5), 'x must be of class character')
  expect_error(ns_search(TRUE), 'x must be of class character')
})
