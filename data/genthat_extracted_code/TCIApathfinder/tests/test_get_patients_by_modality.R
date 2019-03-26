message("\nTesting get_patients_by_modality")

test_that("Structure of patients by modality value", {
  skip_on_cran()
  patients_tcga_mr <- get_patients_by_modality(collection = "TCGA-BRCA", modality = "MR")
  expect_equal(length(patients_tcga_mr), 3)
  expect_true(length(patients_tcga_mr$patient_ids) > 100)
  expect_true(length(patients_tcga_mr$content) > 100)
  expect_equal(class(patients_tcga_mr$response), "response")
})

test_that("Patient values for TCGA-BRCA and MR", {
  skip_on_cran()
  patients_tcga_mr <- get_patients_by_modality(collection = "TCGA-BRCA", modality = "MR")
  expect_true("TCGA-E2-A1B5" %in% patients_tcga_mr$patient_ids)
})

test_that("Nonexistent collection and modality combination", {
  skip_on_cran()
  expect_warning(pat <- get_patients_by_modality(collection = "TCGA-BRCA", modality = "RTSTRUCT"))
  suppressWarnings(pat <- get_patients_by_modality(collection = "TCGA-BRCA", modality = "RTSTRUCT"))
  expect_equal(length(pat$body_parts), 0)
})

test_that("Invalid collection name", {
  skip_on_cran()
  expect_warning(pat <- get_patients_by_modality(collection = "fake_collection", modality = "MR"))
  suppressWarnings(pat <- get_patients_by_modality(collection = "fake_collection", modality = "MR"))
  expect_equal(length(pat$body_parts), 0)
})

test_that("Invalid modality", {
  skip_on_cran()
  expect_warning(pat <- get_patients_by_modality(collection = "TCGA-BRCA", modality = "fake_modality"))
  suppressWarnings(pat <- get_patients_by_modality(collection = "TCGA-BRCA", modality = "fake_modality"))
  expect_equal(length(pat$body_parts), 0)
})

