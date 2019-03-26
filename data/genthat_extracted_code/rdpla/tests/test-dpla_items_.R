context("dpla_items_ - internal fxn")

test_that("dpla_items_ basic functionality works", {
  skip_on_cran()

  aa <- dpla_items_(q = "fruit")

  expect_is(aa, "list")
  expect_named(aa, c("count", "start", "limit", "docs", "facets"))
  expect_type(aa$count, "integer")
  expect_type(aa$start, "integer")
  expect_type(aa$limit, "integer")
  expect_is(aa$docs, "list")
  expect_is(aa$facets, "list")

  expect_equal(length(aa$facets), 0)
  expect_equal(length(aa$docs), 100)
  expect_gt(length(aa$docs[[1]]), 10)
})

test_that("dpla_items_ - pagination works", {
  skip_on_cran()

  aa <- dpla_items_(q="fruit", page_size=2)
  bb <- dpla_items_(q="fruit", page_size=5)

  expect_gt(
    length(unique(pluck(bb$docs, "id", ""))),
    length(unique(pluck(aa$docs, "id", "")))
  )

  # incorrect inputs for pagination fields are dropped silently
  # by DPLA API
  expect_is(dpla_items_(page_size = "asdfasf"), "list")
  expect_is(dpla_items_(page = "asdfasf", page_size = 1), "list")
})

test_that("dpla_items_ - fields requests work", {
  skip_on_cran()

  nms <- c("id", "format", "publisher")
  aa <- dpla_items_(q = "fruit", fields = nms)

  expect_named(
    Filter(function(x) length(names(x)) == 3, aa$docs)[[1]],
    c('id', 'sourceResource.format', 'sourceResource.publisher')
  )
})

test_that("dpla_items_ - date searches work", {
  skip_on_cran()

  aa <- dpla_items_(q = "science", date_before = 1900)
  expect_gt(length(aa$docs[[1]]), 10)
  dates <- na.omit(suppressWarnings(as.numeric(unlist(sapply(aa$docs, function(z) z$sourceResource$date$displayDate)))))
  expect_lte(max(dates), 1900)

  bb <- dpla_items_(date_after = 1900)
  dates <- na.omit(suppressWarnings(as.numeric(unlist(sapply(bb$docs, function(z) z$sourceResource$date$displayDate)))))
  expect_gte(min(dates), 1900)
})

test_that("dpla_items_ - spatial searches work", {
  skip_on_cran()

  # query all spatial fields
  aa <- dpla_items_(sp = 'Boston', page_size = 5)
  expect_match(paste0(as.character(aa$docs), collapse = ""), "Boston")

  # query by state
  bb <- dpla_items_(sp_state = 'Hawaii', page_size = 2)
  expect_is(bb, "list")
  expect_is(bb$docs[[1]]$sourceResource$title, "character")
  #expect_true(any(grepl("Hawaii", bb$docs[[1]]$sourceResource$description)))
})

test_that("dpla_items_ fails well", {
  skip_on_cran()

  # bad auth
  expect_error(dpla_items_(key = "asdfadf"), "Unauthorized")
  # bad sort_by entry
  expect_error(dpla_items_(sort_by = "stuff"),
               "Invalid field\\(s\\) specified in sort_by parameter")
  # bad fields entry
  expect_error(dpla_items_(fields = "stuff"),
               "Invalid field\\(s\\) specified in fields parameter")
})
