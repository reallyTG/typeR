context("vert_id")

test_that("vert_id works", {
  skip_on_cran()

  aa <- vert_id(ids = "urn:catalog:CM:Herps:116520", messages = FALSE)

  expect_is(aa, "list")
  expect_is(aa$meta, "list")
  expect_is(aa$data, "data.frame")
  expect_equal(NROW(aa$data), 1)
  expect_named(aa$meta, c('request_date','response_records','submitted_query',
                          'request_origin','limit','last_cursor',
                          'query_version','matching_records','api_version'))
  expect_true(grepl("bufo debilis", tolower(aa$data$scientificname)))
})

test_that("vert_id works", {
  skip_on_cran()

  ids <- c("http://arctos.database.museum/guid/MSB:Mamm:56979?seid=1643089",
           "urn:catalog:CM:Herps:116520")
  aa <- vert_id(ids, messages = FALSE)

  expect_is(aa, "list")
  expect_is(aa$meta, "list")
  expect_is(aa$data, "data.frame")
  expect_equal(NROW(aa$data), 2)
  expect_named(aa$meta, c('request_date','response_records','submitted_query',
                          'request_origin','limit','last_cursor',
                          'query_version','matching_records','api_version'))
  expect_true(any(grepl("zapus", tolower(aa$data$scientificname))))
  expect_true(any(grepl("bufo", tolower(aa$data$scientificname))))
})
