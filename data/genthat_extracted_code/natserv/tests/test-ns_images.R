context("ns_images")

test_that("ns_images works as expected", {
  skip_on_cran()

  vcr::use_cassette("ns_images", {
    aa <- ns_images(uid = 'ELEMENT_GLOBAL.2.100925')
  })

  expect_is(aa, 'list')
  expect_named(aa, c('terms', 'images'))
  expect_is(aa$terms, 'character')
  expect_is(aa$images, 'list')
  expect_is(aa$images[[1]], 'list')
  expect_is(aa$images[[1]]$id, 'character')
})

test_that("ns_images fails well", {
  skip_on_cran()

  vcr::use_cassette("ns_images_error", {
    expect_error(ns_images(scientificName = "asdfasf"),
                 'no results found')
    expect_error(ns_images(commonName = "asdfasf"),
                 'no results found')
  })

  expect_error(ns_images("adfdf"),
               "one or more 'uid's")

  # fails well when input not character
  expect_error(ns_images(5), 'uid must be of class character')
  expect_error(ns_images(TRUE), 'uid must be of class character')

  expect_error(ns_images(scientificName = 5), 'scientificName must be of class character')
  expect_error(ns_images(commonName = 5), 'commonName must be of class character')
  expect_error(ns_images(includeSynonyms = 5), 'includeSynonyms must be of class character')
  expect_error(ns_images(resolution = 5), 'resolution must be of class character')
  expect_error(ns_images(ITISNames = 5), 'ITISNames must be of class character')
})
