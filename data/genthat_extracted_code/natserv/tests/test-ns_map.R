context("ns_map")

test_that("ns_map_county works as expected", {
  skip_on_cran()

  #dat <- ns_data(uid = 'ELEMENT_GLOBAL.2.100925')
  aa <- ns_map_county(ns_data_output)

  expect_is(aa, 'gg')
  expect_is(aa, 'ggplot')
  expect_is(aa$data, 'data.frame')
  expect_is(aa$layers, 'list')
})

test_that("ns_map_county works as expected", {
  skip_on_cran()

  #dat <- ns_data(uid = 'ELEMENT_GLOBAL.2.100925')
  aa <- ns_map_cons(ns_data_output)

  expect_is(aa, 'gg')
  expect_is(aa, 'ggplot')
  expect_is(aa$data, 'data.frame')
  expect_is(aa$layers, 'list')
})

test_that("ns_map_county works as expected", {
  skip_on_cran()

  #dat <- ns_data(uid = 'ELEMENT_GLOBAL.2.100925')
  aa <- ns_map_stpr(ns_data_output)

  expect_is(aa, 'gg')
  expect_is(aa, 'ggplot')
  expect_is(aa$data, 'data.frame')
  expect_is(aa$layers, 'list')
})

test_that("ns_map fails well", {
  skip_on_cran()

  expect_error(ns_map_county(),
               'argument "x" is missing')

  expect_error(ns_map_county(5),
               'inherits\\(x, "list"\\) is not TRUE')
})
