library(adepro)
context("basic")

test_that("launch_adepro is an appropriate function", {
  expect_that(launch_adepro, is.function)
  expect_warning(expect_error(launch_adepro(data)))
})

test_that("ae_data is a valid input dataset for launch_adepro", {
  expect_that(ae_data, is.data.frame)
  expect_equal(colnames(ae_data)[1:5], c("day_start", "day_end", "patient", "ae", "sev"))
  expect_that(ae_data$ae, is.factor)
  expect_that(ae_data$day_start, is.numeric)
  expect_that(ae_data$day_end, is.numeric)
  expect_that(ae_data$patient, is.numeric)
  expect_that(ae_data$sev, is.numeric)
  expect_true(all(ae_data$day_end >= ae_data$day_start))
})

test_that("patient_data is a valid input dataset for launch_adepro", {
  expect_that(patient_data, is.data.frame)
  expect_equal(colnames(patient_data)[1:4], c("ps", "treat", "end", "death"))
  expect_true(all(is.element(unique(ae_data$patient), unique(patient_data$ps))))
})
