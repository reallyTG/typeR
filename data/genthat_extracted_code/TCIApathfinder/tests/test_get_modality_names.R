message("\nTesting get_modality_names")

test_that("Structure of modalities value", {
  skip_on_cran()
  mod <- get_modality_names()
  expect_equal(length(mod), 3)
  expect_true(length(mod$modalities) > 10)
  expect_true(length(mod$content) > 10)
  expect_equal(class(mod$response), "response")
})

test_that("Modality names for TCGA-BRCA", {
  skip_on_cran()
  mod <- get_modality_names(collection = "TCGA-BRCA")
  expect_true(length(mod$modalities) > 1)
  expect_true("MR" %in% mod$modalities)
})

test_that("Modality names for breast", {
  skip_on_cran()
  mod <- get_modality_names(body_part = "BREAST")
  expect_true(length(mod$modalities) > 3)
  expect_true("MR" %in% mod$modalities)
})

test_that("Modality names for TCGA-BRCA and breast", {
  skip_on_cran()
  mod <- get_modality_names(collection = "TCGA-BRCA", body_part = "BREAST")
  expect_true(length(mod$modalities) > 1)
  expect_true("MR" %in% mod$modalities)
})

test_that("Nonexistent collection and body part combination", {
  skip_on_cran()
  expect_warning(mod <- get_modality_names(collection = "TCGA-BRCA", body_part = "LIVER"))
  suppressWarnings(mod <- get_modality_names(collection = "TCGA-BRCA", body_part = "LIVER"))
  expect_equal(length(mod$modalities), 0)
})

test_that("Invalid collection name", {
  skip_on_cran()
  expect_warning(mod <- get_modality_names(collection = "fake_collection"))
  suppressWarnings(mod <- get_modality_names(collection = "fake_collection"))
  expect_equal(length(mod$modalities), 0)
})

test_that("Invalid body part", {
  skip_on_cran()
  expect_warning(mod <- get_modality_names(body_part = "fake_body_part"))
  suppressWarnings(mod <- get_modality_names(body_part = "fake_body_part"))
  expect_equal(length(mod$modalities), 0)
})


