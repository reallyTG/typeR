library(marinespeed)

context("lapply")

skip <- function() {
  skip_on_cran()
  # skip_on_travis()
  test_dir <- file.path(tempdir(), "marinespeed")
  options(marinespeed_datadir = test_dir)
}

test_that("lapply_species works", {
  skip()
  species_list <- list_species()[,1]
  validate_species <- function(speciesname, occurrences, species_check) {
    if(is.null(species_check)) {
      species_check <- species_list
    }
    expect_true(speciesname %in% species_check)
    expect_gt(nrow(occurrences), 0)
    expect_gt(ncol(occurrences), 50)
    speciesname
  }
  results <- lapply_species(validate_species, species_check = NULL)
  expect_equal(length(results), NROW(species_list))

  results <- lapply_species(validate_species, species_check=species_list[1:5] , species=species_list[1:5])
  expect_equal(length(results), 5)
})

test_that("lapply_kfold_species works", {
  skip()
  species_list <- list_species()[,1]
  validate_species <- function(speciesname, data, fold, species_check, folds_check) {
    if(is.null(species_check)) {
      species_check <- species_list
    }
    expect_true(speciesname %in% species_check)
    expect_true(fold %in% folds_check)
    expect_gt(nrow(data$occurrence_training), 0)
    expect_gt(nrow(data$occurrence_test), 0)
    expect_gt(nrow(data$occurrence_training), nrow(data$occurrence_test))
    expect_gt(nrow(data$background_training), 0)
    expect_gt(nrow(data$background_test), 0)
    expect_gt(nrow(data$background_training), nrow(data$background_test))
    data$occurrence_training[,"longitude"]
  }

  results <- lapply_kfold_species(validate_species, species_check=species_list[3:15], folds_check=2, k=2, species=species_list[3:15])
  expect_equal(length(results), 13)
  expect_true(is.null(results[[1]][[1]]))
  expect_false(is.null(results[[1]][[2]]))
  results <- lapply_kfold_species(validate_species, species_check=species_list[3:15], folds_check=3:4, k=3:4, species=species_list[3:15], fold_type="random")
  expect_equal(length(results), 13)
  expect_true(is.null(results[[1]][[1]]))
  expect_false(is.null(results[[1]][[3]]))
  expect_false(is.null(results[[1]][[4]]))
  ## fold records should be different
  expect_gt(length(setdiff(results[[1]][[3]], results[[1]][[4]])), length(results[[1]][[4]]) / 6)

  results <- lapply_kfold_species(validate_species, species_check=species_list[3:15], folds_check=3, k=3, species=species_list[3:15], fold_type="targetgroup")
  expect_equal(length(results), 13)
  results <- lapply_kfold_species(validate_species, species_check=species_list[3:15], folds_check=3, k=3, species=species_list[3:15], fold_type="grid_4")
  expect_equal(length(results), 13)
  results <- lapply_kfold_species(validate_species, species_check=species_list[3:15], folds_check=8, k=8, species=species_list[3:15], fold_type="grid_9")
  expect_equal(length(results), 13)
})


