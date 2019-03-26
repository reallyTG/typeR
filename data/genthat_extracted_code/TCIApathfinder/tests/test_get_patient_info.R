message("\nTesting get_patient_info")

test_that("Structure of patients value", {
  skip_on_cran()
  patients_tcga <- get_patient_info("TCGA-BRCA")
  expect_equal(length(patients_tcga), 3)
  expect_equal(ncol(patients_tcga$patients), 6)
  expect_true(nrow(patients_tcga$patients) > 50)
  expect_true(length(patients_tcga$content) > 50)
  expect_equal(class(patients_tcga$response), "response")
})

test_that("Number of all patients", {
  skip_on_cran()
  patients_all <- get_patient_info()
  expect_true(nrow(patients_all$patients) > 5000)
  expect_true("TCGA-OL-A6VO" %in% patients_all$patients$patient_id)
  expect_true("TCGA-OL-A6VO" %in% patients_all$patients$patient_name)
  expect_true("F" %in% patients_all$patients$patient_sex)
  expect_true("TCGA-BRCA" %in% patients_all$patients$collection)
})

test_that("Number of BRCA patients", {
  skip_on_cran()
  patients_tcga <- get_patient_info("TCGA-BRCA")
  expect_true(nrow(patients_tcga$patients) > 50)
  expect_true("TCGA-OL-A6VO" %in% patients_tcga$patients$patient_id)
})

test_that("Individual BRCA patient", {
  skip_on_cran()
  patients_all <- get_patient_info()
  pid <- "TCGA-OL-A6VO"
  one_patient <- patients_all$patients[which(patients_all$patients$patient_id == pid), ]
  expect_identical(pid, as.character(one_patient[1, "patient_name"]))
  expect_identical("F", as.character(one_patient[1, "patient_sex"]))
  expect_identical("TCGA-BRCA", as.character(one_patient[1, "collection"]))
  expect_equal(NA, one_patient[1, "patient_dob"])
  expect_equal(NA, one_patient[1, "patient_ethnic_group"])
})

test_that("Invalid collection name", {
  skip_on_cran()
  expect_warning(patients <- get_patient_info("fake collection"))
  suppressWarnings(patients <- get_patient_info("fake collection"))
  expect_equal(length(patients$content), 0)
})

