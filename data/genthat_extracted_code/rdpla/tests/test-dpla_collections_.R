context("dpla_collections_ - internal fxn")

test_that("dpla_collections_ basic functionality works", {
  skip_on_cran()

  aa <- dpla_collections_(q = "university")

  expect_is(aa, "list")
  expect_type(aa$count, "integer")
  expect_type(aa$start, "integer")
  expect_type(aa$limit, "integer")
  expect_type(aa$docs, "list")
  expect_type(aa$facets, "list")

  expect_is(aa$docs[[1]], "list")
  expect_gt(length(aa$docs[[1]]), 10)
})

test_that("dpla_items - pagination works", {
  skip_on_cran()

  aa <- dpla_collections_(q="university of texas", page_size=2)
  bb <- dpla_collections_(q="university of texas", page_size=5)

  expect_gt(length(bb$docs), length(aa$docs))

  # incorrect inputs for pagination fields are dropped silently
  # by DPLA API
  expect_is(dpla_collections_(page_size = "asdfasf"), "list")
  expect_is(dpla_collections_(page = "asdfasf", page_size = 1), "list")
})

test_that("dpla_items - fields requests work", {
  skip_on_cran()

  nms <- c("id", "description", "title")
  aa <- dpla_collections_(q = "university of texas", fields = nms)

  expect_equal(sort(names(aa$docs[[1]])), sort(nms))
})

test_that("dpla_items fails well", {
  skip_on_cran()

  # bad auth
  expect_error(dpla_collections_(key = "asdfadf"), "Unauthorized")
  # bad sort_by entry
  expect_error(dpla_collections_(sort_by = "stuff"),
               "Invalid field\\(s\\) specified in sort_by parameter")
  # bad fields entry
  expect_error(dpla_collections_(fields = "stuff"),
               "Invalid field\\(s\\) specified in fields parameter")
})
