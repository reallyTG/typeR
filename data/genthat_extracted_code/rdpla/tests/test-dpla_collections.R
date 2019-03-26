context("dpla_collections")

test_that("dpla_collections basic functionality works", {
  skip_on_cran()

  aa <- dpla_collections(q = "university")

  expect_is(aa, "list")
  expect_is(aa$meta, "tbl_df")
  expect_type(aa$meta$found, "integer")
  expect_type(aa$meta$returned, "integer")
  expect_is(aa$data, "tbl_df")
  expect_is(aa$data$id, "character")
  expect_gt(NCOL(aa$data), 10)
})

test_that("dpla_items - pagination works", {
  skip_on_cran()

  aa <- dpla_collections(q="university of texas", page_size=2)
  bb <- dpla_collections(q="university of texas", page_size=5)

  expect_gt(NROW(bb$data), NROW(aa$data))

  # incorrect inputs for pagination fields are dropped silently
  # by DPLA API
  expect_is(dpla_collections(page_size = "asdfasf"), "list")
  expect_is(dpla_collections(page = "asdfasf", page_size = 1), "list")
})

test_that("dpla_items - fields requests work", {
  skip_on_cran()

  nms <- c("id", "description", "title")
  aa <- dpla_collections(q = "university of texas", fields = nms)

  expect_equal(sort(names(aa$data)), sort(nms))
})

test_that("dpla_items fails well", {
  skip_on_cran()

  # bad auth
  expect_error(dpla_collections(key = "asdfadf"), "Unauthorized")
  # bad sort_by entry
  expect_error(dpla_collections(sort_by = "stuff"),
               "Invalid field\\(s\\) specified in sort_by parameter")
  # bad fields entry
  expect_error(dpla_collections(fields = "stuff"),
               "Invalid field\\(s\\) specified in fields parameter")
})
