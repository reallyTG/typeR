context("Time Series")

# Set params
Pde <- deviceevent(
  maude,
  time="date_received",
  device_hierarchy=c("device_name", "device_class"),
  event_hierarchy=c("event_type", "medical_specialty_description"),
  key="report_number",
  covariates="region",
  descriptors="_all_")
Pexp <- exposure(
  sales,
  time="sales_month",
  device_hierarchy="device_name",
  match_levels="region",
  count="sales_volume"
)
Pda <- define_analyses(
  Pde, "device_name",
  exposure=Pexp,
  covariates="region")

# Reference examples
a1 <- time_series(Pda[1:3], Pde, Pexp)
a2 <- time_series(Pda[[1]], Pde, Pexp)

# Basic
# -----

# Return behavior
test_that("function returns the correct class", {
  expect_is(a1, "list")
  expect_is(a1[[1]], "mds_ts")
  expect_is(a2, "mds_ts")
})
test_that("parameter requirements as expected", {
  expect_error(time_series())
  expect_error(time_series(list()))
  expect_error(time_series(Pda[[1]]))
  expect_error(time_series(Pda[[1]], foo))
  expect_error(time_series(Pda[[1]], Pde, foo))
  expect_is(time_series(Pda[[1]], Pde), "mds_ts")
  expect_is(time_series(Pda[[1]], Pde, Pexp), "mds_ts")
  expect_is(time_series(Pda[[1]], Pde, use_hierarchy=F), "mds_ts")
  expect_is(time_series(Pda[[1]], Pde, Pexp, use_hierarchy=F), "mds_ts")
})


# Fully specified behavior
# ------------------------

# Attribute check
test_that("attributes are fully described", {
  expect_equal(all(names(attributes(a2)) %in% c(
    "names", "row.names", "class", "title", "analysis", "exposure", "dpa",
    "dpa_detail")),
    T)
  expect_equal(length(attributes(a2)$title), 1)
  expect_equal(length(attributes(a2)$analysis), 16)
  expect_equal(length(attributes(a2)$dpa_detail), 7)
  expect_is(attributes(a2)$exposure, "logical")
  expect_is(attributes(a2)$dpa, "logical")
})

test_that("time series variable classes are correct", {
  expect_is(a2$time, "Date")
  expect_is(a2$nA, "integer")
  expect_is(a2$nB, "integer")
  expect_is(a2$nC, "integer")
  expect_is(a2$nD, "integer")
  expect_is(a2$ids, "list")
  expect_is(a2$exposure, "numeric")
  expect_is(a2$ids_exposure, "list")
})
test_that("ids carried over from source", {
  expect_equal(all(a2$ids[[1]] %in% Pde$key), T)
  expect_equal(all(a2$ids_exposure[[1]] %in% Pexp$key), T)
})

# Barebones behavior
# ------------------

# Reference example
a2 <- time_series(Pda[[1]], Pde)

# Attribute check
test_that("attributes are fully described", {
  expect_equal(all(names(attributes(a2)) %in% c(
    "names", "row.names", "class", "title", "analysis", "exposure", "dpa",
    "dpa_detail")), T)
  expect_equal(length(attributes(a2)$title), 1)
  expect_equal(length(attributes(a2)$analysis), 16)
  expect_equal(length(attributes(a2)$dpa_detail), 7)
  expect_is(attributes(a2)$exposure, "logical")
  expect_is(attributes(a2)$dpa, "logical")
})

test_that("time series variable classes are correct", {
  expect_is(a2$time, "Date")
  expect_is(a2$nA, "integer")
  expect_is(a2$nB, "integer")
  expect_is(a2$nC, "integer")
  expect_is(a2$nD, "integer")
  expect_is(a2$ids, "list")
  expect_null(a2$exposure)
  expect_null(a2$ids_exposure)
})
test_that("ids carried over from source", {
  expect_equal(all(a2$ids[[1]] %in% Pde$key), T)
  expect_equal(all(a2$ids_exposure[[1]] %in% Pexp$key), T)
})
