message("\nTesting get_studies_in_collection")

test_that("Structure of studies by collection", {
  skip_on_cran()
  studies <- get_studies_in_collection("TCGA-BRCA")
  expect_equal(length(studies), 3)
  expect_true(nrow(studies$studies) > 10)
  expect_true(length(studies$content) > 10)
  expect_equal(class(studies$response), "response")
  expect_true("TCGA-OL-A5RU" %in% studies$studies$PatientID)
  expect_true("1.3.6.1.4.1.14519.5.2.1.5382.4002.330793838288961518168640006613" %in% studies$studies$StudyInstanceUID)
  studies_patient <- get_studies_in_collection("TCGA-BRCA", patient_id = "TCGA-OL-A66O")
  expect_true("TCGA-OL-A66O" %in% studies_patient$studies$PatientID)
  expect_true("1.3.6.1.4.1.14519.5.2.1.5382.4002.221816646143692380342454392165" %in% studies_patient$studies$StudyInstanceUID)
})

test_that("Invalid collection name", {
  skip_on_cran()
  expect_warning(studies <- get_studies_in_collection(collection = "fake_collection"))
  suppressWarnings(studies <- get_studies_in_collection(collection = "fake_collection"))
  expect_equal(nrow(studies$studies), 0)
})

test_that("Invalid patient ID", {
  skip_on_cran()
  expect_warning(studies <- get_studies_in_collection(collection = "TCGA-BRCA", patient_id = "fake_patient"))
  suppressWarnings(studies <- get_studies_in_collection(collection = "TCGA-BRCA", patient_id = "fake_patient"))
  expect_equal(nrow(studies$studies), 0)
})

