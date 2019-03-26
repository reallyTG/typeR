context("Device Events")

# Set params
Ptime <- "date_received"
Pdevice_hierarchy <- c("device_name", "device_class")
Pevent_hierarchy <- c("event_type", "medical_specialty_description")
Pkey <- "report_number"
Pcovariates <- "region"
Pdescriptors <- "_all_"
PdescriptorsV <- names(maude)[which(!names(maude) %in% c(Ptime,
                                                         Pdevice_hierarchy,
                                                         Pevent_hierarchy,
                                                         Pkey,
                                                         Pcovariates))]
# Reference example
a1 <- deviceevent(
  maude,
  time=Ptime,
  device_hierarchy=Pdevice_hierarchy,
  event_hierarchy=Pevent_hierarchy,
  key=Pkey,
  covariates=Pcovariates,
  descriptors=Pdescriptors)


# Basic
# -----

# Return behavior
test_that("function returns the correct class", {
  expect_is(a1, "data.frame")
  expect_is(a1, "mds_de")
})
test_that("parameter requirements as expected", {
  expect_error(deviceevent())
  expect_error(deviceevent(maude))
  expect_error(deviceevent(maude, Ptime))
  expect_error(deviceevent(maude, Ptime, Pdevice_hierarchy[1]))
  expect_is(deviceevent(maude, Ptime, Pdevice_hierarchy[1], Pevent_hierarchy[1]),
            "mds_de")
  expect_error(deviceevent(maude, Ptime, Pdevice_hierarchy[1], Pevent_hierarchy[1],
                           key="foo"))
  expect_is(deviceevent(maude, Ptime, Pdevice_hierarchy[1], Pevent_hierarchy[1],
                        covariates="_all_"),
            "mds_de")
  expect_error(deviceevent(maude, Ptime, Pdevice_hierarchy[1], Pevent_hierarchy[1],
                           covariates="foo"))
  expect_error(deviceevent(maude, Ptime, Pdevice_hierarchy[1], Pevent_hierarchy[1],
                           descriptors="foo"))
  expect_error(deviceevent(maude, Ptime, Pdevice_hierarchy[1], Pevent_hierarchy[1],
                           implant_days="foo"))
  expect_error(deviceevent(maude, Ptime, Pdevice_hierarchy[1], Pevent_hierarchy[1],
                           implant_days="brand_name"))
})
# Attribute check
test_that("attributes are fully described", {
  expect_equal(all(names(attributes(a1)) %in% c(
    "names", "row.names", "class", "time", "device_hierarchy",
    "event_hierarchy", "key", "covariates", "descriptors")), T)
  expect_equal(attributes(a1)$time, Ptime)
  expect_equal(attributes(a1)$device_hierarchy,
               setNames(Pdevice_hierarchy, c("device_1", "device_2")))
  expect_equal(attributes(a1)$event_hierarchy,
               setNames(Pevent_hierarchy, c("event_1", "event_2")))
  expect_equal(attributes(a1)$key, Pkey)
  expect_equal(attributes(a1)$covariates,
               setNames(Pcovariates, Pcovariates))
  expect_equal(attributes(a1)$descriptors,
               setNames(PdescriptorsV, PdescriptorsV))
})


# Fully specified behavior
# ------------------------

test_that("output shape is as expected", {
  expect_equal(nrow(a1), nrow(maude))
  expect_equal(ncol(a1), ncol(maude))
  expect_equal(sum(is.na(a1$model_number)), sum(is.na(maude$model_number)))
  expect_equal(sum(is.na(a1$report_source_code)), sum(is.na(maude$report_source_code)))
})

test_that("input variable matches mapped output variable", {
  expect_equal(as.character(a1$key), maude$report_number)
  expect_equal(gsub("-", "", as.character(lubridate::ymd(a1$time))),
               maude$date_received)
  expect_equal(as.character(a1$device_1), maude$device_name)
  expect_equal(as.character(a1$device_2), maude$device_class)
  expect_equal(as.character(a1$event_1), maude$event_type)
  expect_equal(as.character(a1$event_2),
               maude$medical_specialty_description)
  expect_equal(as.character(a1$region), maude$region)
  expect_equal(a1$product_problem_flag, maude$product_problem_flag)
  expect_equal(a1$adverse_event_flag, maude$adverse_event_flag)
  expect_equal(a1$report_source_code, maude$report_source_code)
  expect_equal(a1$lot_number, maude$lot_number)
  expect_equal(a1$model_number, maude$model_number)
  expect_equal(a1$manufacturer_d_name, maude$manufacturer_d_name)
  expect_equal(a1$manufacturer_d_country, maude$manufacturer_d_country)
  expect_equal(a1$brand_name, maude$brand_name)
  expect_equal(PdescriptorsV[which(!PdescriptorsV %in% names(a1))], character(0))
})

test_that("output variable class converted correctly", {
  expect_is(a1$key, "character")
  expect_is(a1$time, "Date")
  expect_is(a1$device_1, "factor")
  expect_is(a1$device_2, "factor")
  expect_is(a1$event_1, "factor")
  expect_is(a1$event_2, "factor")
  expect_is(a1$region, "factor")
})

test_that("no extra variables were created", {
  expect_null(a1$device_3)
  expect_null(a1$event_3)
})

test_that("descriptors were kept in source format", {
  expect_is(class(a1$key), "character")
  expect_equal(class(a1$product_problem_flag), class(maude$product_problem_flag))
  expect_equal(class(a1$adverse_event_flag), class(maude$adverse_event_flag))
  expect_equal(class(a1$report_source_code), class(maude$report_source_code))
  expect_equal(class(a1$lot_number), class(maude$lot_number))
  expect_equal(class(a1$model_number), class(maude$model_number))
  expect_equal(class(a1$manufacturer_d_name), class(maude$manufacturer_d_name))
  expect_equal(class(a1$manufacturer_d_country), class(maude$manufacturer_d_country))
  expect_equal(class(a1$brand_name), class(maude$brand_name))
})

# Barebones behavior
# ------------------

# Set params
Ptime="date_received"
Pdevice_hierarchy="device_name"
Pevent_hierarchy="event_type"
# Reference example
a1 <- deviceevent(
  maude,
  time=Ptime,
  device_hierarchy=Pdevice_hierarchy,
  event_hierarchy=Pevent_hierarchy)

test_that("minimal parameters output shape is as expected", {
  expect_equal(nrow(a1), nrow(maude))
  expect_equal(ncol(a1), 4)
  expect_equal(a1$key, as.character(c(1:nrow(maude))))
  expect_null(a1$report_source_code)
})

