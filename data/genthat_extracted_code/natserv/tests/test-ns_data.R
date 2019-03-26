context("ns_data")

test_that("ns_data works as expected", {
  skip_on_cran()

  vcr::use_cassette("ns_data", {
    aa <- ns_data(uid = 'ELEMENT_GLOBAL.2.100925')
  })

  expect_is(aa, 'list')
  expect_is(aa[[1]], 'list')
  expect_is(aa[[1]]$distribution, 'list')
  expect_is(aa[[1]]$distribution$countyDistribution$US$AZ, 'data.frame')

  expect_match(aa[[1]]$natureserve_uri, 'explorer.natureserve.org')
})

test_that("ns_data eg works that didn't used to work", {
  skip_on_cran()

  # this didn't work cause Canada didn't have subnation data,
  # but should be fixed now
  vcr::use_cassette("ns_data_fixed", {
    aa <- ns_data(uid = 'ELEMENT_GLOBAL.2.101998')
  })

  expect_is(aa, 'list')
  expect_is(aa[[1]], 'list')
  expect_is(aa[[1]]$distribution, 'list')
  expect_equal(length(aa$ELEMENT_GLOBAL.2.101998$distribution$nations$CA), 0)
  expect_gt(length(aa$ELEMENT_GLOBAL.2.101998$distribution$nations$US$subnations), 0)
})

test_that("ns_data fails well", {
  skip_on_cran()

  expect_error(ns_data(),
               'argument "uid" is missing')
  expect_error(ns_data("asdfasf"),
               "one or more 'uid's")

  # fails well when input not character
  expect_error(ns_data(5), 'uid must be of class character')
  expect_error(ns_data(TRUE), 'uid must be of class character')
})
