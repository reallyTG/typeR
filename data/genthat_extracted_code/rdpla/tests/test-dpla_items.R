context("dpla_items")

test_that("dpla_items basic functionality works", {
  skip_on_cran()

  aa <- dpla_items(q = "fruit")

  expect_is(aa, "list")
  expect_is(aa$meta, "tbl_df")
  expect_type(aa$meta$found, "integer")
  expect_type(aa$meta$returned, "integer")
  expect_is(aa$data, "tbl_df")
  expect_is(aa$data$id, "character")
  expect_is(aa$facets, "list")
  expect_equal(length(aa$facets), 0)

  expect_gt(NCOL(aa$data), 10)
})

test_that("dpla_items - pagination works", {
  skip_on_cran()

  aa <- dpla_items(q="fruit", page_size=2)
  bb <- dpla_items(q="fruit", page_size=5)

  expect_gt(length(unique(bb$data$id)), length(unique(aa$data$id)))

  # incorrect inputs for pagination fields are dropped silently
  # by DPLA API
  expect_is(dpla_items(page_size = "asdfasf"), "list")
  expect_is(dpla_items(page = "asdfasf", page_size = 1), "list")
})

test_that("dpla_items - fields requests work", {
  skip_on_cran()

  nms <- c("id", "format", "publisher")
  aa <- suppressWarnings(dpla_items(q = "fruit", fields = nms))

  expect_named(aa$data, nms)
})

test_that("dpla_items - date searches work", {
  skip_on_cran()

  aa <- dpla_items(q = "science", date_before = 1900)
  dates <- na.omit(suppressWarnings(as.numeric(unlist(aa$data$date))))
  expect_lte(max(dates), 1900)

  bb <- dpla_items(date_after = 1980)
  dates <- na.omit(suppressWarnings(as.numeric(unlist(bb$data$date))))
  expect_gte(min(dates), 1900)
})

test_that("dpla_items - spatial searches work", {
  skip_on_cran()

  # query all spatial fields
  aa <- dpla_items(sp = 'Boston', page_size = 5)
  expect_match(paste0(as.character(aa$data), collapse = ""), "Boston")

  # query by state
  bb <- dpla_items(sp_state = 'Hawaii', page_size = 2)
  expect_is(bb, "list")
  expect_is(bb$data, "tbl_df")
  #expect_match(paste(bb$data$description, collapse = " "), "Hawaii")
})

test_that("dpla_items fails well", {
  skip_on_cran()

  # what has to be one of 2 things
  expect_error(dpla_items(what = "stuff"), "what must be one of")
  # bad auth
  expect_error(dpla_items(key = "asdfadf"), "Unauthorized")
  # bad sort_by entry
  expect_error(dpla_items(sort_by = "stuff"),
               "Invalid field\\(s\\) specified in sort_by parameter")
  # bad fields entry
  expect_error(dpla_items(fields = "stuff"),
               "Invalid field\\(s\\) specified in fields parameter")
})
