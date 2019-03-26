library(marinespeed)

context("kfold")

lonlat_data <- function(species=NULL, nrow=50, seed=42, stringsAsFactors = TRUE) {
  set.seed(seed)
  if(!is.null(species)) {
    lonlat <- data.frame(species=rep(species, nrow), stringsAsFactors = stringsAsFactors)
  } else {
    lonlat <- data.frame(row.names = 1:nrow)
  }
  lonlat[,"longitude"] <- runif(nrow, -180, 180)
  lonlat[,"latitude"] <- runif(nrow, -90, 90)
  lonlat
}

fold_lengths <- function(folds, k=5) {
  sapply(1:k, function(k) sum(folds==k))
}

test_that("kfold disc returns a vector of valid folds", {

  d <- lonlat_data(nrow=50)
  set.seed(42)
  folds <- kfold_disc(d, k=5)
  lengths <- fold_lengths(folds, k=5)
  expect_equal(sum(lengths), 50)
  expect_equal(max(lengths) - min(lengths), 0)

  d <- lonlat_data(nrow=49)
  set.seed(42)
  folds <- kfold_disc(d, k=5)
  lengths <- fold_lengths(folds, k=5)
  expect_equal(sum(lengths), 49)
  expect_equal(max(lengths) - min(lengths), 1)

  plot_folds(d, folds)
})

test_that("kfold disc works with lonlat=FALSE works", {
  d <- lonlat_data(nrow=50)
  set.seed(42)
  folds <- kfold_disc(d, k=5, lonlat = FALSE)
  set.seed(42)
  folds2 <- kfold_disc(d, k=5, lonlat = FALSE)
  set.seed(42)
  folds_lonlat <- kfold_disc(d, k=5, lonlat = TRUE)
  expect_identical(folds, folds2) ## should be the same
  expect_false(identical(folds, folds_lonlat)) ## should be different
  lengths <- fold_lengths(folds, k=5)
  expect_equal(sum(lengths), 50)
  expect_equal(max(lengths) - min(lengths), 0)

  expect_error(kfold_disc(d, k=NA, lonlat = FALSE))
  expect_error(kfold_disc(d, k=NROW(d), lonlat = FALSE))

})

test_that("kfold_grid returns valid folds", {
  d <- lonlat_data(nrow=40)
  set.seed(42)
  folds <- kfold_grid(d, k=4, lonlat = TRUE)
  lengths <- fold_lengths(folds, k=4)
  expect_equal(sum(lengths), 40)
  expect_equal(max(lengths) - min(lengths), 0)

  d <- lonlat_data(nrow=43)
  set.seed(42)
  folds <- kfold_grid(d, k=4, lonlat = TRUE)
  lengths <- fold_lengths(folds, k=4)
  expect_equal(sum(lengths), 43)
  expect_equal(max(lengths) - min(lengths), 1)

  d <- lonlat_data(nrow=45)
  set.seed(42)
  folds <- kfold_grid(d, k=9, lonlat = TRUE)
  lengths <- fold_lengths(folds, k=9)
  expect_equal(sum(lengths), 45)
  expect_equal(max(lengths) - min(lengths), 0)

  d <- lonlat_data(nrow=44)
  set.seed(42)
  folds <- kfold_grid(d, k=9, lonlat = TRUE)
  lengths <- fold_lengths(folds, k=9)
  expect_equal(sum(lengths), 44)
  expect_equal(max(lengths) - min(lengths), 1)

  folds <- kfold_grid(d, k=1, lonlat = TRUE)
  expect_true(all(folds == 1))

  expect_error(kfold_grid(d, k=NA, lonlat = FALSE))
  expect_error(kfold_grid(d, k=11, lonlat = FALSE))
  expect_error(kfold_grid(d, k=NROW(d), lonlat = FALSE))
})

validate_folds <- function(folds) {
  occ <- folds$occurrence
  ## each point in occurrence only once in test set
  expect_true(all(rowSums(occ[,2:ncol(occ)]) == (ncol(occ) - 2)))
}

test_that("kfold_species_background with default settings works", {
  occurrence_data <- lonlat_data("Testis testatus", nrow=20)
  background_data <- lonlat_data("background", nrow=200, seed = 21)
  set.seed(42)
  folds <- kfold_occurrence_background(occurrence_data, background_data)
  expect_equal(NROW(folds$occurrence), 20)
  expect_equal(NROW(folds$background), 200)
  expect_true(is.factor(folds$occurrence[1,1]))
  expect_equal(as.character(folds$occurrence[1,1]), "Testis testatus")
  expect_equal(as.character(folds$background[1,1]), "background")
  expect_equal(NCOL(folds$occurrence), 6)
  expect_equal(NCOL(folds$background), 6)
  validate_folds(folds)

  occurrence_data <- lonlat_data("Testis testatus", nrow=20, stringsAsFactors = FALSE)
  background_data <- lonlat_data("background", nrow=200, seed = 21,  stringsAsFactors = FALSE)
  set.seed(42)
  folds <- kfold_occurrence_background(occurrence_data, background_data)
  expect_equal(folds$occurrence[1,1], "Testis testatus") ## should not be factor
  expect_equal(folds$background[1,1], "background")
  expect_false(is.factor(folds$occurrence[1,1]))
  expect_false(is.factor(folds$background[1,1]))
  validate_folds(folds)

  expect_error(kfold_occurrence_background(occurrence_data, background_data, occurrence_fold_type = "blablabla"))

})

test_that("kfold_species_background with different settings works", {
  species <- lonlat_data("Testis testatus", nrow=50, stringsAsFactors = FALSE)
  background <- lonlat_data("background", nrow=200, seed = 21, stringsAsFactors = FALSE)
  ## default lonlat
  set.seed(42)
  folds1 <- kfold_occurrence_background(species, background)
  set.seed(42)
  folds2 <- kfold_occurrence_background(species, background, lonlat = TRUE)
  expect_identical(folds1, folds2)
  validate_folds(folds1)

  ## lonlat = FALSE
  set.seed(42)
  folds3 <- kfold_occurrence_background(species, background, lonlat = FALSE)
  expect_false(identical(folds1, folds3))
  validate_folds(folds3)

  ## pwd_sample = FALSE
  set.seed(42)
  folds4 <- kfold_occurrence_background(species, background, pwd_sample = FALSE)
  expect_false(identical(folds1, folds4))
  validate_folds(folds4)
  expect_lt(sum(complete.cases(folds4$background)), NROW(folds4$background))

  ## occurrence_fold_type = "random"
  set.seed(42)
  folds5 <- kfold_occurrence_background(species, background, occurrence_fold_type = "random")
  expect_false(identical(folds1, folds5))
  validate_folds(folds5)
  expect_lt(sum(complete.cases(folds5$background)), NROW(folds5$background)) ## background points filtered out

  ## background_buffer = 0
  set.seed(42)
  folds6 <- kfold_occurrence_background(species, background, occurrence_fold_type = "random", background_buffer = 0)
  expect_false(identical(folds5, folds6))
  validate_folds(folds6)
  expect_equal(sum(complete.cases(folds6$background)), NROW(folds6$background)) ## no background buffer so point is either training or test

  ## background_buffer = -1
  set.seed(42)
  folds7 <- kfold_occurrence_background(species, background, occurrence_fold_type = "random", background_buffer = -1)
  expect_identical(folds6, folds7)
  validate_folds(folds7)
  expect_equal(sum(complete.cases(folds7$background)), NROW(folds7$background)) ## no background buffer so point is either training or test

  set.seed(42)
  folds7 <- kfold_occurrence_background(species, background, occurrence_fold_type = "random", background_buffer = NA)
  expect_identical(folds6, folds7)
  validate_folds(folds7)
  expect_equal(sum(complete.cases(folds7$background)), NROW(folds7$background)) ## no background buffer so point is either training or test

  ## random, pwd_sample = F, background_buffer = 0
  set.seed(42)
  folds8 <- kfold_occurrence_background(species, background, occurrence_fold_type = "random", background_buffer = 0, pwd_sample = FALSE)
  expect_false(identical(folds6, folds8))
  expect_equal(sum(complete.cases(folds8$background)), NROW(folds8$background))
  validate_folds(folds8)

  ## random, pwd_sample = F, background_buffer = 1000*1000
  set.seed(42)
  folds9 <- kfold_occurrence_background(species, background, occurrence_fold_type = "random", background_buffer = 1000*1000, pwd_sample = FALSE)
  expect_lt(sum(complete.cases(folds9$background)), sum(complete.cases(folds5$background)))
  expect_equal(sum(folds9$background[,2:6]==FALSE, na.rm = TRUE), 200) ## expect 200 background test points when pwd_sample = FALSE
  validate_folds(folds9)

  ## huge background_buffer (no training background points selected)
  set.seed(42)
  folds9b <- kfold_occurrence_background(species, background, occurrence_fold_type = "random", background_buffer = 100000*1000, pwd_sample = FALSE)
  expect_equal(sum(complete.cases(folds9b$background)), 0)
  expect_equal(sum(folds9b$background[,2:6]==FALSE, na.rm = TRUE), 200) ## expect 200 background test points when pwd_sample = FALSE

  ## k = 10
  set.seed(42)
  folds10 <- kfold_occurrence_background(species, background, k = 10, occurrence_fold_type = "random", background_buffer = 0, pwd_sample = FALSE)
  expect_equal(NCOL(folds10$occurrence), 11)
  expect_equal(NCOL(folds10$background), 11)
  validate_folds(folds10)

  ## occurrence_fold_type = "grid"
  set.seed(42)
  folds11 <- kfold_occurrence_background(species, background, occurrence_fold_type = "grid", k=4)
  expect_false(identical(folds1, folds11))
  validate_folds(folds11)
  expect_lt(sum(complete.cases(folds11$background)), NROW(folds11$background)) ## background points filtered out
})
