message("\nTesting get_body_part_names")

test_that("Structure of body parts value", {
  skip_on_cran()
  bp_names_all <- get_body_part_names()
  expect_equal(length(bp_names_all), 3)
  expect_true(length(bp_names_all$body_parts) > 20)
  expect_true(length(bp_names_all$content) > 20)
  expect_equal(class(bp_names_all$response), "response")
})

test_that("Body part values for TCGA-BRCA", {
  skip_on_cran()
  bp_names_tcga <- get_body_part_names(collection = "TCGA-BRCA")
  expect_identical(bp_names_tcga$body_parts, c("BREAST"))
})

test_that("Body part values for MR", {
  skip_on_cran()
  bp_names_mr <- get_body_part_names(modality = "MR")
  expect_true(length(bp_names_mr$body_parts) > 10)
  expect_true("BREAST" %in% bp_names_mr$body_parts)
})

test_that("Body part values for TCGA-BRCA and MR", {
  skip_on_cran()
  bp_names_tcga_mr <- get_body_part_names(collection = "TCGA-BRCA", modality = "MR")
  expect_identical(bp_names_tcga_mr$body_parts, c("BREAST"))
})

test_that("Nonexistent collection and modality combination", {
  skip_on_cran()
  expect_warning(bp <- get_body_part_names(collection = "TCGA-BRCA", modality = "RTSTRUCT"))
  suppressWarnings(bp <- get_body_part_names(collection = "TCGA-BRCA", modality = "RTSTRUCT"))
  expect_equal(length(bp$body_parts), 0)
})

test_that("Invalid collection name", {
  skip_on_cran()
  expect_warning(bp <- get_body_part_names(collection = "fake_collection"))
  suppressWarnings(bp <- get_body_part_names(collection = "fake_collection"))
  expect_equal(length(bp$body_parts), 0)
})

test_that("Invalid modality", {
  skip_on_cran()
  expect_warning(bp <- get_body_part_names(modality = "fake_modality"))
  suppressWarnings(bp <- get_body_part_names(modality = "fake_modality"))
  expect_equal(length(bp$body_parts), 0)
})


