library(marinespeed)

context("load")

setup_load <- function() {
  skip_on_cran()
  # skip_on_travis()
  test_dir <- file.path(tempdir(), "marinespeed")
  options(marinespeed_datadir = test_dir)
}

test_that("get datadir", {
  tmp <- tempdir()
  options(marinespeed_datadir=tmp)
  expect_equal(marinespeed:::get_datadir(), file.path(tmp, get_version()))
  options(marinespeed_datadir=NULL)
  t <- function() {
    expect_true(dir.exists(marinespeed:::get_datadir()))
  }
  expect_warning(t())
})

test_that("get version", {
  expect_equal(get_version(), "v1")
  options(marinespeed_version="V.test")
  expect_equal(get_version(), "V.test")
  options(marinespeed_version=NULL)
  expect_equal(get_version(), "v1")
})

test_that("get file works and handles errors", {
  check <- function(filename, should_exist) {
    p <-file.path(marinespeed:::get_datadir(), filename)
    if(file.exists(p)) file.remove(p)
    if(should_exist) {
      marinespeed:::get_file(filename)
    } else {
      expect_error(marinespeed:::get_file(filename))
    }
    expect_equal(file.exists(p), should_exist)
  }
  check(filename = "species.csv.gz", should_exist = TRUE)
  check("blablabla.csv.gz", should_exist = FALSE)
})

test_that("list species", {
  setup_load()

  species <- list_species()
  expect_gt(NROW(species), 500)
  expect_equal(NCOL(species), 2)
  expect_equal(colnames(species), c("species", "aphia_id"))
})

test_that("species info", {
  setup_load()

  info <- species_info()
  species <- list_species()[,"species"]
  expect_gt(NROW(info), 500)
  expect_gt(NCOL(info), 5)
  expect_equal(colnames(info[,1:4]), c("species", "aphia_id", "kingdom", "phylum"))
})


test_that("get occurrences works", {
  setup_load()

  abalistes_stellatus <- get_occurrences("Abalistes stellatus")
  expect_gt(NROW(abalistes_stellatus), 10)
  expect_gt(NCOL(abalistes_stellatus), 50)

  species <- list_species()
  occ <- get_occurrences(species[1:3,])
  expect_gt(NROW(occ), 10)
  expect_gt(NCOL(occ), 50)
  expect_equal(length(unique(occ$species)), 3)

  expect_warning(get_occurrences("Blabla blabla"))

})

test_that("get_fold_data different variations", {
  setup_load()

  check_fold <- function(fold) {
    expect_gt(NROW(fold$occurrence_training), 9)
    expect_gt(NROW(fold$occurrence_test), 9)
    expect_true(all(complete.cases(fold$occurrence_training)))
    expect_true(all(complete.cases(fold$occurrence_test)))
    expect_false(NROW(fold$occurrence_training) == NROW(fold$occurrence_test))
    expect_gt(NROW(fold$background_training), 1000)
    expect_true(all(complete.cases(fold$background_training)))
    expect_true(all(complete.cases(fold$background_test)))
    expect_false(NROW(fold$background_training) == NROW(fold$background_test))
    expect_gt(NCOL(fold$occurrence_training), 50)
    expect_equal(NCOL(fold$occurrence_test), NCOL(fold$occurrence_training))
    expect_equal(NCOL(fold$background_training), NCOL(fold$occurrence_training))
    expect_equal(NCOL(fold$background_test), NCOL(fold$occurrence_test))
  }

  folds <- get_fold_data("Abra alba", fold_type = "random", k=c(2,4))

  expect_null(folds[[1]])
  check_fold(folds[[2]])
  expect_null(folds[[3]])
  check_fold(folds[[4]])
  expect_null(folds[[5]])
  ## fold records should be different
  expect_gt(length(setdiff(folds[[2]]$occurrence_training[,"longitude"], folds[[4]]$occurrence_training[,"longitude"])), nrow(folds[[2]]$occurrence_training) / 6)

  folds_random <- folds

  folds <- get_fold_data("Abra alba", fold_type = "disc", k=c(2,4))

  expect_null(folds[[1]])
  check_fold(folds[[2]])
  expect_null(folds[[3]])
  check_fold(folds[[4]])
  expect_null(folds[[5]])
  ## fold records should be different
  expect_gt(length(setdiff(folds[[2]]$occurrence_training[,"longitude"], folds[[4]]$occurrence_training[,"longitude"])), nrow(folds[[2]]$occurrence_training) / 6)

  ## random should be different from disc fold
  expect_gt(length(setdiff(folds[[2]]$occurrence_training[,"longitude"], folds_random[[2]]$occurrence_training[,"longitude"])), nrow(folds[[2]]$occurrence_training) / 10)


  folds <- get_fold_data("Dinoperca petersi", fold_type = "disc", k=1:5)
  lapply(folds, check_fold)

  folds <- get_fold_data(species="Dinoperca petersi", fold_type = "grid_9", k=c(1, 3, 9))
  check_fold(folds[[1]])
  check_fold(folds[[3]])
  check_fold(folds[[9]])
  for(i in c(2,4:8)) expect_null(folds[[i]])

  options(marinespeed_folds_extension = ".csv.gz")
  f1 <- get_fold_data("Dinoperca petersi", fold_type = "grid_4", k=c(1, 4))
  check_fold(f1[[1]])
  check_fold(f1[[4]])
  for(i in 2:3) expect_null(f1[[i]])

  options(marinespeed_folds_extension = "_bit.rds")
  f2 <- get_fold_data("Dinoperca petersi", fold_type = "grid_4", k=c(1, 4))
  expect_equal(f1, f2)

  expect_error(get_fold_data(c("Dinoperca petersi", "Abra alba")))
  expect_error(get_fold_data("Dinoperca petersi", fold_type = "grid_9", k=0))
  expect_error(get_fold_data("Dinoperca petersi", fold_type = "grid_9", k=10))
  expect_error(get_fold_data("Dinoperca petersi", fold_type = "grid_4", k=5))
  expect_error(get_fold_data("Dinoperca petersi", fold_type = "random", k=6))
  expect_error(get_fold_data("Dinoperca petersi", fold_type = "random", k=c(1,2,6)))
  expect_error(get_fold_data("Dinoperca petersi", fold_type = "blablabla", k=1))
  expect_error(get_fold_data("Dinoperca petersi", fold_type = "random", k=NA))
  expect_error(get_fold_data(1, fold_type = "random", k=1))
})

test_that("get_file works", {
  setup_load()
  tmp <- tempdir()
  options(marinespeed_datadir=tmp)
  file <- get_file("species.csv.gz")
  expect_true(file.exists(file))
  species <- read.csv(file)
  expect_gt(NROW(species), 500)
  file.remove(file)
  expect_false(file.exists(file))
  options(marinespeed_datadir=NULL)
})

test_that("get_folds works", {
  setup_load()
  check_classic_folds <- function(fold_name, k=5) {
    skip_on_cran()
    folds <- get_folds(fold_name)
    expect_equal(NCOL(folds$background),k+1)
    expect_equal(NCOL(folds$species),k+1)
    expect_gt(NROW(folds$background),1000)
    expect_gt(NROW(folds$species),10000)
  }
  options(marinespeed_folds_extension = ".csv.gz")
  check_classic_folds("disc")
  check_classic_folds("random")
  check_classic_folds("targetgroup")
  check_classic_folds("grid_4", k = 4)
  check_classic_folds("grid_9", k = 9)

  check_bit_folds <- function(folds, k=5) {
    expect_equal(class(folds$species), "marinespeed_folds")
    expect_equal(class(folds$background), "marinespeed_folds")
    expect_gt(length(folds$species$species), 500)
    expect_gt(length(folds$background$species), 0)
    expect_true(all(paste0("k", 1:k) %in% names(folds$background)))
    expect_true(all(paste0("k", 1:k) %in% names(folds$species)))
    expect_true(bit::is.bit(folds$species$k1))
    expect_true(bit::is.bit(folds$background$k1))
  }
  options(marinespeed_folds_extension = "_bit.rds")
  check_bit_folds(get_folds("disc"))
  check_bit_folds(get_folds("random"))
  check_bit_folds(get_folds("targetgroup"))
  check_bit_folds(get_folds("grid_4"), k = 4)
  check_bit_folds(get_folds("grid_9"), k = 9)
  options(marinespeed_datadir=tempdir())
  check_bit_folds(get_folds("random"))

  expect_error(get_folds("blabla"))
})

test_that("get_background works", {
  setup_load()
  check_background <- function(bg) {
    expect_equal(NCOL(bg), 71)
    expect_gt(NROW(bg), 1000)
  }
  check_background(get_background("random"))
  check_background(get_background("targetgroup"))

  expect_error(get_background("blabla"))
})

test_that("csv2rds works", {
  setup_load()

  f <- marinespeed:::get_file("species.csv.gz")
  f2 <- file.path(tempdir(), "species.csv.gz")
  file.copy(f, f2)
  sp1 <- marinespeed:::csv2rds(f2)
  sp2 <- read.csv(f)
  expect_equal(sp1, sp2)
  expect_true(file.exists(file.path(tempdir(), "species.rds")))

  dir <- file.path(tempdir(), "masptest")
  if(dir.exists(dir)) { unlink(dir, recursive = TRUE) }
  fulldir <- file.path(dir, get_version())
  options(marinespeed_datadir = dir)
  options(marinespeed_folds_extension = ".csv.gz")
  f1 <- get_folds("random")
  expect_true(file.exists(file.path(fulldir, "random_background_5cv_folds.csv.gz")))
  expect_true(file.exists(file.path(fulldir, "random_species_5cv_folds.csv.gz")))
  expect_true(file.exists(file.path(fulldir, "random_species_5cv_folds.rds")))
  expect_true(file.exists(file.path(fulldir, "random_background_5cv_folds.rds")))

  options(marinespeed_folds_extension = "_bit.rds")
  f2 <- get_folds("random")
  expect_true(file.exists(file.path(fulldir, "random_species_5cv_folds_bit.rds")))
  expect_true(file.exists(file.path(fulldir, "random_background_5cv_folds_bit.rds")))

  rand_bg <- marinespeed:::csv2rds(file.path(fulldir, "random_background_5cv_folds.csv.gz"), "_bit.rds")
  expect_equal(rand_bg, f2$background)

  expect_error(marinespeed:::csv2rds("blablabla.txt"))
})
