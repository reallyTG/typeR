message("\nTesting get_series_info")

test_that("Relative response sizes", {
  skip_on_cran()
  series_series_id <- get_series_info(series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867")
  series_coll <- get_series_info(collection = "TCGA-BRCA")
  series_pat <- get_series_info(patient_id = "TCGA-OL-A5DA")
  series_model <- get_series_info(manufacturer_model_name = "Symphony")
  series_all <- get_series_info()
  series_pat_series_id <- get_series_info(patient_id = "TCGA-OL-A5DA", series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867")
  series_manufacturer <- get_series_info(manufacturer = "SIEMENS")
  expect_true(nrow(series_pat$series) > nrow(series_series_id$series))
  expect_true(nrow(series_all$series) > nrow(series_coll$series))
  expect_true(nrow(series_coll$series) > nrow(series_pat$series))
  expect_true(nrow(series_manufacturer$series) > nrow(series_model$series))
  expect_equal(nrow(series_pat_series_id$series), nrow(series_series_id$series))
})

test_that("Response intersection", {
  skip_on_cran()
  series_pat <- get_series_info(patient_id = "TCGA-OL-A5DA")
  series_all <- get_series_info()
  series_study_uid <- get_series_info(study_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.104582989590517557856962159716")
  series_modality <- get_series_info(modality = "MR")
  series_series_id <- get_series_info(series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867")
  series_coll <- get_series_info(collection = "TCGA-BRCA")
  expect_true(all(unique(series_study_uid$series$series_instance_uid) %in% unique(series_pat$series$series_instance_uid)))
  expect_true(all(unique(series_modality$series$series_instance_uid) %in% unique(series_all$series$series_instance_uid)))
  expect_true(all(unique(series_series_id$series$series_instance_uid) %in% unique(series_study_uid$series$series_instance_uid)))
  expect_true(all(unique(series_coll$series$patient_id) %in% unique(series_all$series$patient_id)))
})

test_that("Structure of series value", {
  skip_on_cran()
  series_all <- get_series_info()
  series_coll <- get_series_info(collection = "TCGA-BRCA")
  series_manufacturer <- get_series_info(manufacturer = "SIEMENS")
  expect_equal(length(series_all), 3)
  expect_equal(ncol(series_coll$series), 15)
  expect_true(length(series_all$content) > 1000)
  expect_equal(class(series_manufacturer$response), "response")
})

test_that("Collection", {
  skip_on_cran()
  series_coll <- get_series_info(collection = "TCGA-BRCA")
  expect_true(nrow(series_coll$series) > 100)
})

test_that("Patient ID", {
  skip_on_cran()
  series_pat <- get_series_info(patient_id = "TCGA-OL-A5DA")
  expect_true(nrow(series_pat$series) > 5)
})

test_that("Study instance UID", {
  skip_on_cran()
  series_study_uid <- get_series_info(study_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.104582989590517557856962159716")
  expect_true(nrow(series_study_uid$series) > 5)
})

test_that("Series instance UID", {
  skip_on_cran()
  series_series_id <- get_series_info(series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867")
  series_pat_series_id <- get_series_info(patient_id = "TCGA-OL-A5DA", series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867")
  expect_equal(nrow(series_series_id$series), 1)
  expect_equal(nrow(series_pat_series_id$series), 1)
})

test_that("Modality", {
  skip_on_cran()
  series_modality <- get_series_info(modality = "MR")
  expect_true(nrow(series_modality$series) > 1000)
})

test_that("Manufacturer model name", {
  skip_on_cran()
  series_model <- get_series_info(manufacturer_model_name = "Symphony")
  expect_true(nrow(series_model$series) > 100)
})

test_that("Manufacturer", {
  skip_on_cran()
  series_manufacturer <- get_series_info(manufacturer = "SIEMENS")
  expect_true(nrow(series_manufacturer$series) > 100)
})

test_that("Particular series", {
  skip_on_cran()
  series_series_id <- get_series_info(series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867")
  expect_identical(as.character(series_series_id$series[1, "study_instance_uid"]), "1.3.6.1.4.1.14519.5.2.1.5382.4002.104582989590517557856962159716")
  expect_identical(as.character(series_series_id$series[1, "series_instance_uid"]), "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867")
  expect_identical(as.character(series_series_id$series[1, "modality"]), "MR")
  expect_identical(as.character(series_series_id$series[1, "body_part_examined"]), "BREAST")
})

test_that("Invalid collection", {
  skip_on_cran()
  expect_warning(s <- get_series_info(collection = "fake collection"))
  suppressWarnings(s <- get_series_info(collection = "fake collection"))
  expect_equal(length(s$content), 0)
})

test_that("Invalid patient ID", {
  skip_on_cran()
  expect_warning(s <- get_series_info(patient_id = "fake id"))
  suppressWarnings(s <- get_series_info(patient_id = "fake id"))
  expect_equal(length(s$content), 0)
})

test_that("Invalid study instance UID", {
  skip_on_cran()
  expect_warning(s <- get_series_info(study_instance_uid = "fake id"))
  suppressWarnings(s <- get_series_info(study_instance_uid = "fake id"))
  expect_equal(length(s$content), 0)
})

test_that("Invalid series instance UID", {
  skip_on_cran()
  expect_warning(s <- get_series_info(series_instance_uid = "fake id"))
  suppressWarnings(s <- get_series_info(series_instance_uid = "fake id"))
  expect_equal(length(s$content), 0)
})

test_that("Invalid modality", {
  skip_on_cran()
  expect_warning(s <- get_series_info(modality = "fake modality"))
  suppressWarnings(s <- get_series_info(modality = "fake modality"))
  expect_equal(length(s$content), 0)
})

test_that("Invalid body part", {
  skip_on_cran()
  expect_warning(s <- get_series_info(body_part_examined = "fake body part"))
  suppressWarnings(s <- get_series_info(body_part_examined = "fake body part"))
  expect_equal(length(s$content), 0)
})

test_that("Invalid manufacturer model name", {
  skip_on_cran()
  expect_warning(s <- get_series_info(manufacturer_model_name = "fake model name"))
  suppressWarnings(s <- get_series_info(manufacturer_model_name = "fake model name"))
  expect_equal(length(s$content), 0)
})

test_that("Invalid manufacturer", {
  skip_on_cran()
  expect_warning(s <- get_series_info(manufacturer = "fake manufacturer"))
  suppressWarnings(s <- get_series_info(manufacturer = "fake manufacturer"))
  expect_equal(length(s$content), 0)
})










