message("\nTesting get_patient_studies")

test_that("Structure of patient studies value", {
  skip_on_cran()
  ps_all <- get_patient_studies()
  ps_coll <- get_patient_studies(collection = "TCGA-BRCA")
  ps_uid <- get_patient_studies(study_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.104582989590517557856962159716")
  ps_pat_coll_uid <- get_patient_studies(patient_id = "TCGA-OL-A5DA", study_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.104582989590517557856962159716", collection = "TCGA-BRCA")
  expect_equal(length(ps_all), 3)
  expect_equal(ncol(ps_coll$patient_studies), 13)
  expect_true(nrow(ps_coll$patient_studies) > 50)
  expect_equal(nrow(ps_uid$patient_studies), 1)
  expect_true(length(ps_all$content) > 1000)
  expect_equal(class(ps_pat_coll_uid$response), "response")
})

test_that("Patients", {
  skip_on_cran()
  ps_all <- get_patient_studies()
  expect_true(nrow(ps_all$patient_studies) > 5000)
  expect_true("TCGA-OL-A6VO" %in% ps_all$patient_studies$patient_id)
  expect_true("TCGA-OL-A6VO" %in% ps_all$patient_studies$patient_name)
  expect_true("F" %in% ps_all$patient_studies$patient_sex)
  expect_true("TCGA-BRCA" %in% ps_all$patient_studies$collection)
})

test_that("Number of BRCA patients", {
  skip_on_cran()
  ps_coll <- get_patient_studies(collection = "TCGA-BRCA")
  expect_true(nrow(ps_coll$patient_studies) > 100)
  expect_true("TCGA-OL-A6VO" %in% ps_coll$patient_studies$patient_id)
})

test_that("Particular patient", {
  skip_on_cran()
  ps_pat_coll_uid <- get_patient_studies(patient_id = "TCGA-OL-A5DA", study_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.104582989590517557856962159716", collection = "TCGA-BRCA")
  df <- ps_pat_coll_uid$patient_studies
  expect_identical(as.character(df[1, "patient_id"]), "TCGA-OL-A5DA")
  expect_identical(as.character(df[1, "patient_name"]), "TCGA-OL-A5DA")
  expect_true(is.na(as.character(df[1, "patient_dob"])))
  expect_identical(as.character(df[1, "study_instance_uid"]), "1.3.6.1.4.1.14519.5.2.1.5382.4002.104582989590517557856962159716")
})

test_that("Relative response sizes", {
  skip_on_cran()
  ps_all <- get_patient_studies()
  ps_coll <- get_patient_studies(collection = "TCGA-BRCA")
  ps_pat_coll <- get_patient_studies(collection = "TCGA-BRCA", patient_id = "TCGA-OL-A5DA")
  ps_pat_coll_uid <- get_patient_studies(patient_id = "TCGA-OL-A5DA", study_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.104582989590517557856962159716", collection = "TCGA-BRCA")
  ps_coll_uid <- get_patient_studies(study_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.104582989590517557856962159716", collection = "TCGA-BRCA")
  ps_pat <- get_patient_studies(patient_id = "TCGA-OL-A5DA")
  expect_true(nrow(ps_all$patient_studies) > nrow(ps_coll$patient_studies))
  expect_true(nrow(ps_coll$patient_studies) > nrow(ps_pat$patient_studies))
  expect_equal(dim(ps_pat_coll$patient_studies), dim(ps_pat$patient_studies))
  expect_equal(dim(ps_pat_coll_uid$patient_studies), dim(ps_coll_uid$patient_studies))
})

test_that("Invalid collection", {
  skip_on_cran()
  expect_warning(ps <- get_patient_studies(collection = "fake collection"))
  suppressWarnings(ps <- get_patient_studies(collection = "fake collection"))
  expect_equal(length(ps$content), 0)
})

test_that("Invalid patient ID", {
  skip_on_cran()
  expect_warning(ps <- get_patient_studies(patient_id = "fake patient_id"))
  suppressWarnings(ps <- get_patient_studies(patient_id = "fake patient_id"))
  expect_equal(length(ps$content), 0)
})

test_that("Invalid UID", {
  skip_on_cran()
  expect_warning(ps <- get_patient_studies(study_instance_uid = "fake study_instance_uid"))
  suppressWarnings(ps <- get_patient_studies(study_instance_uid = "fake study_instance_uid"))
  expect_equal(length(ps$content), 0)
})
