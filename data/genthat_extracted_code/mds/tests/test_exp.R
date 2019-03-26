context("Exposure")

# Set params
Ptime <- "sales_month"
Pdevice_hierarchy <- "device_name"
Pevent_hierarchy <- NULL
Pkey <- NULL
Pmatch_levels <- "region"
Pcount <- "sales_volume"

# Reference example
a1 <- exposure(
  sales,
  time=Ptime,
  device_hierarchy=Pdevice_hierarchy,
  match_levels=Pmatch_levels,
  count=Pcount
)


# Basic
# -----

# Return behavior
test_that("function returns the correct class", {
  expect_is(a1, "data.frame")
  expect_is(a1, "mds_e")
})
test_that("parameter requirements as expected", {
  expect_error(exposure())
  expect_error(exposure(sales))
  expect_error(exposure(sales, Ptime))
  expect_is(exposure(sales, Ptime, Pdevice_hierarchy), "mds_e")
  expect_error(exposure(sales, Ptime, Pdevice_hierarchy, event_hierarchy="foo"))
  expect_error(exposure(sales, Ptime, Pdevice_hierarchy, key="foo"))
  expect_error(exposure(sales, Ptime, Pdevice_hierarchy, match_levels="foo"))
  expect_error(exposure(sales, Ptime, Pdevice_hierarchy, count="foo"))
})
# Attribute check
test_that("attributes are fully described", {
  expect_equal(all(names(attributes(a1)) %in% c(
    "names", "row.names", "class", "time", "device_hierarchy", "match_levels",
    "count")), T)
  expect_equal(attributes(a1)$time, Ptime)
  expect_equal(attributes(a1)$device_hierarchy,
               setNames(Pdevice_hierarchy, c("device_1")))
  expect_equal(attributes(a1)$match_levels, Pmatch_levels)
  expect_equal(attributes(a1)$count, Pcount)
})


# Fully specified behavior
# ------------------------

test_that("output shape is as expected", {
  expect_equal(nrow(a1), nrow(sales))
  expect_equal(ncol(a1), ncol(sales) + 1)
  expect_equal(sum(is.na(a1[[Pmatch_levels]])), sum(is.na(sales[[Pmatch_levels]])))
  expect_equal(sum(is.na(a1$device_1)), sum(is.na(sales[[Pdevice_hierarchy]])))
})

test_that("input variable matches mapped output variable", {
  expect_equal(as.character(a1$key), as.character(c(1:nrow(sales))))
  expect_equal(a1$time, sales[[Ptime]])
  expect_equal(a1$count, sales[[Pcount]])
  expect_equal(as.character(a1[[Pmatch_levels]]), sales[[Pmatch_levels]])
  expect_equal(as.character(a1$device_1), sales[[Pdevice_hierarchy]])
})

test_that("output variable class converted correctly", {
  expect_is(a1$key, "character")
  expect_is(a1$time, "Date")
  expect_is(a1$device_1, "factor")
  expect_is(a1[[Pmatch_levels]], "factor")
  expect_is(a1$count, "numeric")
})

test_that("no extra variables were created", {
  expect_null(a1$device_2)
  expect_null(a1$event_1)
  expect_null(a1$country)
})

test_that("descriptors were kept in source format", {
  expect_is(class(a1$key), "character")
  expect_equal(class(a1$count), class(sales[[Pcount]]))
})

# Barebones behavior
# ------------------

# Set params
Ptime <- "sales_month"
Pdevice_hierarchy <- "device_name"

# Reference example
a1 <- exposure(
  sales,
  time=Ptime,
  device_hierarchy=Pdevice_hierarchy
)

test_that("minimal parameters output shape is as expected", {
  expect_equal(nrow(a1), nrow(sales))
  expect_equal(ncol(a1), ncol(sales))
  expect_equal(a1$key, as.character(c(1:nrow(sales))))
  expect_null(a1$region)
})

