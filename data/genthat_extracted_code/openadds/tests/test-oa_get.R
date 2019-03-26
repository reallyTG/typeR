context("oa_get")

test_that("oa_get works", {
  skip_on_cran()

  # works for zip files
  url1 <- "http://data.openaddresses.io/runs/128358/us/ma/town_of_newton.zip"
  aa <- oa_get(url1)

  expect_is(aa, "oa")
  expect_is(aa[[1]], "data.frame")
  expect_equal(attr(aa, "id"), url1)

  # works for csv files
  url2 <- "http://data.openaddresses.io/runs/142443/us/md/howard.zip"
  bb <- suppressWarnings(oa_get(url2))

  expect_is(bb, "oa")
  expect_is(bb[[1]], "data.frame")
  expect_equal(attr(bb, "id"), url2)

  # # works for geojson files
  # cc <- oa_get('http://data.openaddresses.io.s3.amazonaws.com/20150523/br-pe-recife.zip')
  #
  # expect_is(cc, "oa")
  # expect_is(cc[[1]], "data.frame")
  # expect_equal(attr(cc, "id"), urls[2])
  # # geojson data exists
  # expect_true("geometry.type" %in% names(cc[[1]]))
  # expect_true("geometry.coordinates" %in% names(cc[[1]]))
  # expect_is(cc[[1]]$geometry.coordinates[[1]], "array")
  # expect_type(cc[[1]]$geometry.coordinates[[1]][,,1], "double")
})

test_that("oa_get fails well", {
  skip_on_cran()

  expect_error(oa_get(), "argument \"x\" is missing")
  expect_error(oa_get("adfdfasdfassdf"), "input doesn't appear to be an Openaddresses URL")

  expect_error(oa_get(NA_character_), "input was NULL or NA")

  expect_error(oa_get(5), "no 'oa_get' method")
  expect_error(oa_get(NA), "no 'oa_get' method")
})

# test_that("oa_get works when multiple data files to read", {
#   url_mont <- 'http://data.openaddresses.io/runs/104134/us/ia/montgomery.zip'
#   dd <- oa_get(url_mont)
#   expect_is(dd, "oa")
# })
