context("Define Analyses")

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
Pdevice_level="device_name"
Pcovariates="region"

# Reference example
a1 <- define_analyses(
  Pde, Pdevice_level,
  exposure=Pexp,
  covariates=Pcovariates)

# Basic
# -----

# Return behavior
test_that("function returns the correct class", {
  expect_is(a1, "list")
  expect_is(a1, "mds_das")
})
test_that("parameter requirements as expected", {
  expect_error(define_analyses())
  expect_error(define_analyses(Pde))
  expect_error(define_analyses(foo))
  expect_error(define_analyses(Pde, foo))
  expect_error(define_analyses(foo, foo))
  expect_is(define_analyses(Pde, Pdevice_level), "mds_das")
})
test_that("event_level accepts only legal values", {
  expect_error(define_analyses(Pde, Pdevice_level, event_level="foo"))
  expect_error(define_analyses(Pde, Pdevice_level, event_level="device_1"))
  expect_error(define_analyses(Pde, Pdevice_level, event_level="event_1"))
  expect_error(define_analyses(Pde, Pdevice_level, event_level="lot_number"))
  expect_is(define_analyses(Pde, Pdevice_level, event_level="event_type"),
            "mds_das")
})
test_that("exposure accepts only legal values", {
  expect_error(define_analyses(Pde, Pdevice_level, exposure="foo"))
  expect_error(define_analyses(Pde, Pdevice_level, exposure="device_1"))
  expect_error(define_analyses(Pde, Pdevice_level, exposure="event_1"))
  expect_error(define_analyses(Pde, Pdevice_level, exposure="lot_number"))
  expect_is(define_analyses(Pde, Pdevice_level, exposure=Pexp),
            "mds_das")
})
test_that("date_level accepts only legal values", {
  expect_error(define_analyses(Pde, Pdevice_level, date_level="month"))
  expect_error(define_analyses(Pde, Pdevice_level, date_level="day"))
  expect_error(define_analyses(Pde, Pdevice_level, date_level="years"))
  expect_error(define_analyses(Pde, Pdevice_level, date_level="device_1"))
  expect_error(define_analyses(Pde, Pdevice_level, date_level="event_1"))
  expect_error(define_analyses(Pde, Pdevice_level, date_level="lot_number"))
  expect_is(define_analyses(Pde, Pdevice_level, date_level="days"),
            "mds_das")
})
test_that("date_level_n accepts only legal values", {
  expect_error(define_analyses(Pde, Pdevice_level, date_level_n="foo"))
  expect_error(define_analyses(Pde, Pdevice_level, date_level_n=1.5))
  expect_error(define_analyses(Pde, Pdevice_level, date_level_n=0))
  expect_error(define_analyses(Pde, Pdevice_level, date_level_n=-1))
  expect_is(define_analyses(Pde, Pdevice_level, date_level_n=2),
            "mds_das")
})
test_that("covariates accepts only legal values", {
  expect_error(define_analyses(Pde, Pdevice_level, covariates="foo"))
  expect_error(define_analyses(Pde, Pdevice_level, covariates="device_1"))
  expect_error(define_analyses(Pde, Pdevice_level, covariates="event_1"))
  expect_error(define_analyses(Pde, Pdevice_level, covariates="lot_number"))
  expect_is(define_analyses(Pde, Pdevice_level, covariates=Pcovariates),
            "mds_das")
  expect_is(define_analyses(Pde, Pdevice_level, covariates="_all_"),
            "mds_das")
})
test_that("times_to_calc accepts only legal values", {
  expect_error(define_analyses(Pde, Pdevice_level, times_to_calc="foo"))
  expect_error(define_analyses(Pde, Pdevice_level, times_to_calc=1.5))
  expect_error(define_analyses(Pde, Pdevice_level, times_to_calc=0))
  expect_error(define_analyses(Pde, Pdevice_level, times_to_calc=-1))
  expect_is(define_analyses(Pde, Pdevice_level, times_to_calc=2),
            "mds_das")
})

# Attribute check
test_that("attributes are fully described and consistent", {
  expect_equal(all(names(attributes(a1)) %in% c(
    "date_level", "date_level_n", "device_level", "prior_used", "timestamp",
    "class")), T)
  expect_equal(attributes(a1)$date_level, "months")
  expect_equal(attributes(a1)$date_level_n, 1)
  expect_equal(attributes(a1)$device_level, Pdevice_level)
  expect_equal(attributes(a1)$prior_used, F)
  expect_is(attributes(a1)$timestamp, "POSIXct")
})


# Fully specified behavior
# ------------------------

test_that("individual analysis is specified as expected", {
  expect_is(a1[[1]], "mds_da")
  expect_equal(a1[[1]]$device_level_source, Pdevice_level)
  expect_equal(a1[[1]]$covariate, Pcovariates)
  expect_equal(sum(is.na(a1[[1]]$date_range_exposure)), 0)
  expect_equal(length(a1[[1]]$exp_covariate_level), 1)
  expect_is(a1[[length(a1)]], "mds_da")
  expect_equal(a1[[length(a1)]]$device_level_source, Pdevice_level)
  expect_equal(a1[[length(a1)]]$covariate, "Data")
  expect_equal(sum(is.na(a1[[length(a1)]]$date_range_exposure)), 0)
  expect_equal(length(a1[[length(a1)]]$exp_covariate_level), 1)
})


# Barebones behavior
# ------------------

# Reference example
a1 <- define_analyses(Pde, Pdevice_level)

test_that("barebones individual analysis is specified as expected", {
  expect_is(a1[[1]], "mds_da")
  expect_equal(a1[[1]]$device_level_source, Pdevice_level)
  expect_equal(a1[[1]]$covariate, "Data")
  expect_equal(a1[[1]]$date_range_exposure, as.Date(c(NA, NA)))
  expect_equal(a1[[1]]$exp_covariate_level, setNames(NA, NA))
})

# Attribute check
test_that("barebones attributes are fully described and consistent", {
  expect_equal(all(names(attributes(a1)) %in% c(
    "date_level", "date_level_n", "device_level", "prior_used", "timestamp",
    "class")), T)
  expect_equal(attributes(a1)$date_level, "months")
  expect_equal(attributes(a1)$date_level_n, 1)
  expect_equal(attributes(a1)$device_level, Pdevice_level)
  expect_equal(attributes(a1)$prior_used, F)
  expect_is(attributes(a1)$timestamp, "POSIXct")
})


# Time Change behavior
# --------------------

# Reference example
a1 <- define_analyses(
  Pde, Pdevice_level,
  date_level="days",
  date_level_n=7)

# Attribute check
test_that("time change attributes are consistent", {
  expect_equal(attributes(a1)$date_level, "days")
  expect_equal(attributes(a1)$date_level_n, 7)
})


# Hierarchy Behavior
# ------------------

# Reference example (single level device, no event, covariate)
Pde <- deviceevent(
  maude,
  time="date_received",
  device_hierarchy=c("device_name"),
  event_hierarchy=c("event_type", "medical_specialty_description"),
  key="report_number",
  covariates="region",
  descriptors="_all_")
Pdevice_level="device_name"
Pcovariates="region"
a1 <- define_analyses(
  Pde, Pdevice_level,
  exposure=Pexp,
  covariates=Pcovariates)
test_that("device hierarchy as expected for single-level device", {
  expect_equal(names(a1[[1]]$device_level), "device_1")
  expect_equal(names(a1[[1]]$device_1up), "device_1")
})
test_that("event hierarchy as expected for single-level device", {
  expect_equal(names(a1[[1]]$event_level), "event_1")
  expect_true(is.na(a1[[1]]$event_1up))
})
test_that("exposure hierarchy as expected for single-level device", {
  expect_equal(names(a1[[1]]$exp_device_level), "device_1")
  expect_equal(names(a1[[1]]$exp_device_1up), "device_1")
})
# Variant with last level of hierarchy
Pde <- deviceevent(
  maude,
  time="date_received",
  device_hierarchy=c("device_name", "device_class"),
  event_hierarchy=c("event_type", "medical_specialty_description"),
  key="report_number",
  covariates="region",
  descriptors="_all_")
Pdevice_level="device_class"
Pcovariates="region"
a1 <- define_analyses(
  Pde, Pdevice_level,
  exposure=Pexp,
  covariates=Pcovariates)
test_that("device hierarchy as expected for single-level device", {
  expect_equal(names(a1[[1]]$device_level), "device_2")
  expect_equal(names(a1[[1]]$device_1up), "device_2")
})
test_that("event hierarchy as expected for single-level device", {
  expect_equal(names(a1[[1]]$event_level), "event_1")
  expect_true(is.na(a1[[1]]$event_1up))
})
test_that("exposure hierarchy as expected for single-level device", {
  expect_true(is.na(names(a1[[1]]$exp_device_level)))
  expect_true(is.na(names(a1[[1]]$exp_device_1up)))
})

# Multi-level device
Pde <- deviceevent(
  maude,
  time="date_received",
  device_hierarchy=c("device_name", "device_class"),
  event_hierarchy=c("event_type", "medical_specialty_description"),
  key="report_number",
  covariates="region",
  descriptors="_all_")
Pdevice_level="device_name"
a1 <- define_analyses(
  Pde,
  device_level=Pdevice_level,
  exposure=Pexp,
  covariates=Pcovariates)
test_that("device hierarchy as expected for multi-level device", {
  expect_equal(names(a1[[1]]$device_level), "device_1")
  expect_equal(names(a1[[1]]$device_1up), "device_2")
})
test_that("event hierarchy as expected for multi-level device", {
  expect_equal(names(a1[[1]]$event_level), "event_1")
  expect_true(is.na(a1[[1]]$event_1up))
})
test_that("exposure hierarchy as expected for multi-level device", {
  expect_equal(names(a1[[1]]$exp_device_level), "device_1")
  expect_true(is.na(names(a1[[1]]$exp_device_1up)))
})

# Single-level event
Pde <- deviceevent(
  maude,
  time="date_received",
  device_hierarchy=c("device_name"),
  event_hierarchy=c("event_type"),
  key="report_number",
  covariates="region",
  descriptors="_all_")
Pdevice_level="device_name"
Pcovariates="region"
Pevent_level="event_type"
a1 <- define_analyses(
  Pde,
  device_level=Pdevice_level,
  event_level=Pevent_level,
  exposure=Pexp,
  covariates=Pcovariates)
test_that("device hierarchy as expected for single-level event", {
  expect_equal(names(a1[[1]]$device_level), "device_1")
  expect_equal(names(a1[[1]]$device_1up), "device_1")
})
test_that("event hierarchy as expected for single-level event", {
  expect_equal(names(a1[[1]]$event_level), "event_1")
  expect_true(is.na(a1[[1]]$event_1up))
})
test_that("exposure hierarchy as expected for single-level event", {
  expect_equal(names(a1[[1]]$exp_device_level), "device_1")
  expect_equal(names(a1[[1]]$exp_device_1up), "device_1")
})
# Variant with last level of hierarchy
Pde <- deviceevent(
  maude,
  time="date_received",
  device_hierarchy=c("device_name"),
  event_hierarchy=c("event_type", "medical_specialty_description"),
  key="report_number",
  covariates="region",
  descriptors="_all_")
Pdevice_level="device_name"
Pcovariates="region"
Pevent_level="medical_specialty_description"
a1 <- define_analyses(
  Pde,
  device_level=Pdevice_level,
  event_level=Pevent_level,
  exposure=Pexp,
  covariates=Pcovariates)
test_that("device hierarchy as expected for single-level event", {
  expect_equal(names(a1[[1]]$device_level), "device_1")
  expect_equal(names(a1[[1]]$device_1up), "device_1")
})
test_that("event hierarchy as expected for single-level event", {
  expect_equal(names(a1[[1]]$event_level), "event_2")
  expect_true(is.na(a1[[1]]$event_1up))
})
test_that("exposure hierarchy as expected for single-level event", {
  expect_equal(names(a1[[1]]$exp_device_level), "device_1")
  expect_equal(names(a1[[1]]$exp_device_1up), "device_1")
})

# Multi-level event
Pde <- deviceevent(
  maude,
  time="date_received",
  device_hierarchy=c("device_name"),
  event_hierarchy=c("event_type", "medical_specialty_description"),
  key="report_number",
  covariates="region",
  descriptors="_all_")
Pevent_level="event_type"
a1 <- define_analyses(
  Pde,
  device_level=Pdevice_level,
  event_level=Pevent_level,
  exposure=Pexp,
  covariates=Pcovariates)
test_that("device hierarchy as expected for multi-level event", {
  expect_equal(names(a1[[1]]$device_level), "device_1")
  expect_equal(names(a1[[1]]$device_1up), "device_1")
})
test_that("event hierarchy as expected for multi-level event", {
  expect_equal(names(a1[[1]]$event_level), "event_1")
  expect_equal(names(a1[[1]]$event_1up), "event_2")
})
test_that("exposure hierarchy as expected for multi-level event", {
  expect_equal(names(a1[[1]]$exp_device_level), "device_1")
  expect_equal(names(a1[[1]]$exp_device_1up), "device_1")
})

# Multi-level device, multi-level event
Pde <- deviceevent(
  maude,
  time="date_received",
  device_hierarchy=c("device_name", "device_class"),
  event_hierarchy=c("event_type", "medical_specialty_description"),
  key="report_number",
  covariates="region",
  descriptors="_all_")
Pdevice_level="device_name"
Pevent_level="event_type"
a1 <- define_analyses(
  Pde,
  device_level=Pdevice_level,
  event_level=Pevent_level,
  exposure=Pexp,
  covariates=Pcovariates)
test_that("device hierarchy as expected for multi-level device & event", {
  expect_equal(names(a1[[1]]$device_level), "device_1")
  expect_equal(names(a1[[1]]$device_1up), "device_2")
})
test_that("event hierarchy as expected for multi-level device & event", {
  expect_equal(names(a1[[1]]$event_level), "event_1")
  expect_equal(names(a1[[1]]$event_1up), "event_2")
})
test_that("exposure hierarchy as expected for multi-level device & event", {
  expect_equal(names(a1[[1]]$exp_device_level), "device_1")
  expect_true(is.na(names(a1[[1]]$exp_device_1up)))
})


# ------------------------------------------------------------------------------
# define_analyses_dataframe()
# ------------------------------------------------------------------------------

# Reference example
a1 <- define_analyses(
  Pde, Pdevice_level,
  exposure=Pexp,
  covariates=Pcovariates)
a3 <- define_analyses_dataframe(a1)

test_that("output structure as expected", {
  expect_is(a3, "data.frame")
  expect_equal(nrow(a3), length(a1))
  expect_equal(a3$device_level_source[1], attributes(a1)$device_level)
})


# summary.mds_das()
# -----------------

# Reference example
a2 <- summary(a1)

test_that("output groups as expected", {
  expect_equal(all(names(a2) %in% c(
    "Analyses Timestamp", "Analyses Counts", "Date Ranges")), T)
})
test_that("timestamp is equal to analyses", {
  expect_equal(a2$`Analyses Timestamp`, attributes(a1)$timestamp)
})
test_that("Analyses counts are populated", {
  expect_equal(names(a2$`Analyses Counts`),
               c("Total Analyses", "Analyses with Exposure", "Device Levels",
                 "Event Levels", "Covariates"))
  expect_is(a2$`Analyses Counts`, "integer")
  expect_equal(all(a2$`Analyses Counts` > 0), T)
})
test_that("Date ranges are populated", {
  expect_equal(names(a2$`Date Ranges`), c("Data", "Start", "End"))
  expect_equal(as.character(a2$`Date Ranges`$Data),
               c("Device-Event", "Exposure", "Both"))
  expect_is(a2$`Date Ranges`$Start, "Date")
  expect_is(a2$`Date Ranges`$End, "Date")
})
