message("\nTesting get_new_patients_in_collection")

test_that("Structure of new patients by collection", {
  skip_on_cran()
  pat <- get_new_patients_in_collection("TCGA-BRCA", "2014-01-01")
  expect_equal(length(pat), 3)
  expect_true(length(pat$patient_ids) > 10)
  expect_true(length(pat$content) > 10)
  expect_equal(class(pat$response), "response")
  expect_true("TCGA-OL-A5RU" %in% pat$patient_ids)
})

test_that("No new patients since date", {
  skip_on_cran()
  expect_warning(pat <- get_new_patients_in_collection(collection = "TCGA-BRCA", date = "9999-01-01"))
  suppressWarnings(pat <- get_new_patients_in_collection(collection = "TCGA-BRCA", date = "9999-01-01"))
  expect_equal(length(pat$patient_ids), 0)
})

test_that("Invalid collection name", {
  skip_on_cran()
  expect_warning(pat <- get_new_patients_in_collection(collection = "fake_collection", date = "2011-01-01"))
  suppressWarnings(pat <- get_new_patients_in_collection(collection = "fake_collection", date = "2011-01-01"))
  expect_equal(length(pat$body_parts), 0)
})

test_that("Invalid date", {
  skip_on_cran()
  expect_error(pat <- get_new_patients_in_collection(collection = "TCGA-BRCA", date = "01-01-14"))
  expect_error(pat <- get_new_patients_in_collection(collection = "TCGA-BRCA", date = "01-01-2014"))
  expect_error(pat <- get_new_patients_in_collection(collection = "TCGA-BRCA", date = "January 1, 2014"))
  expect_error(pat <- get_new_patients_in_collection(collection = "TCGA-BRCA", date = "1/1/14"))
  expect_error(pat <- get_new_patients_in_collection(collection = "TCGA-BRCA", date = "1/1/2014"))
  expect_error(pat <- get_new_patients_in_collection(collection = "TCGA-BRCA", date = "01/01/2014"))
})


