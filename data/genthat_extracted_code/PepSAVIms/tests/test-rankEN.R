
# ``````````````````` #
#  Load testing data  #
# ................... #

# load(file.path("..", "data", "data-rankEN-test.RData"))
source(file.path("..", "construct-data", "cd-rankEN-test.R"))




# `````````````````````````````````````````````````` #
#  Valid input with various argument specifications  #
# .................................................. #

context("rankEN method")

test_that("filterMS: msObj with valid input", {

  # msObj: filterMS object
  out <- rankEN(filterMS_obj, bioact, reg_idx, reg_idx, lambda)
  expect_identical(true_rankEN$pos, out)

  # bioact: matrix
  out <- rankEN(msDatObj, bioact, reg_idx, reg_idx, lambda)
  expect_identical(true_rankEN$pos, out)

  # bioact: data.frame
  out <- rankEN(msDatObj, bio_df, reg_idx, reg_idx, lambda)
  expect_identical(true_rankEN$pos, out)

  # bioact: vector
  out <- rankEN(msDatObj, bio_vec, reg_idx, reg_idx, lambda)
  expect_identical(true_rankEN_bio_ave, out)

  # bioact: (1 x n) matrix
  out <- rankEN(msDatObj, bio_matr_ave, reg_idx, reg_idx, lambda)
  expect_identical(true_rankEN_bio_ave, out)

  # region_ms, region_bio: character, numeric
  out <- rankEN(msDatObj, bioact, paste0(reg_idx), reg_idx, lambda)
  expect_identical(true_rankEN$pos, out)

  # region_ms, region_bio: character, character
  out <- rankEN(msDatObj, bioact, paste0(reg_idx), paste0(reg_idx), lambda)
  expect_identical(true_rankEN$pos, out)

  # region_ms, region_bio: NULL, numeric
  out <- rankEN(ms_reg_only, bioact, NULL, reg_idx, lambda)
  expect_identical(true_rankEN$pos, out)

  # region_ms, region_bio: numeric, NULL
  out <- rankEN(msDatObj, bio_reg_only, reg_idx, NULL, lambda)
  expect_identical(true_rankEN$pos, out)

  # region_ms, region_bio: numeric, NULL (with bioact a vector)
  out <- rankEN(msDatObj, bio_vec_reg_only, reg_idx, NULL, lambda)
  expect_identical(true_rankEN_bio_ave, out)

  # pos_only, ncomp: TRUE, 10 (i.e. keep only positive, limit to 10)
  out <- rankEN(msDatObj, bioact, reg_idx, reg_idx, lambda, TRUE, 10L)
  expect_identical(true_rankEN$pos_10, out)

  # pos_only, ncomp: FALSE, NULL (i.e. keep all)
  out <- rankEN(msDatObj, bioact, reg_idx, reg_idx, lambda, FALSE, NULL)
  expect_identical(true_rankEN$all, out)

  # pos_only, ncomp: FALSE, 10 (i.e. limit to 10, may be either pos or neg)
  out <- rankEN(msDatObj, bioact, reg_idx, reg_idx, lambda, FALSE, 10L)
  expect_identical(true_rankEN$all_10, out)
})




# ``````````````````````````` #
#  Missing param for formals  #
# ........................... #

test_that("rankEN: missing input", {

  # Note that the remaining formal args have defaults

  # msObj missing
  expect_error(rankEN( , bioact, reg_idx, reg_idx, lambda),
               "Must provide an argument for msObj" )

  # bioact missing
  expect_error(rankEN(msDatObj, , reg_idx, reg_idx, lambda),
               "Must provide an argument for bioact" )

  # lambda missing
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx, ),
               "Must provide an argument for lambda" )
})




# ```````````````````````````````` #
#  Argument is nonexistent object  #
# ................................ #

test_that("rankEN: nonexistent object", {

  # msObj arg a nonexistent object
  expect_error(rankEN(asdf, bioact, reg_idx, reg_idx, lambda),
               "object 'asdf' not found for msObj")

  # bioact arg a nonexistent object
  expect_error(rankEN(filterMS_obj, asdf, reg_idx, reg_idx, lambda),
               "object 'asdf' not found for bioact")

  # region_ms arg a nonexistent object
  expect_error(rankEN(filterMS_obj, bioact, asdf, reg_idx, lambda),
               "object 'asdf' not found for region_ms")

  # region_bio arg a nonexistent object
  expect_error(rankEN(filterMS_obj, bioact, reg_idx, asdf, lambda),
               "object 'asdf' not found for region_bio")

  # lambda arg a nonexistent object
  expect_error(rankEN(filterMS_obj, bioact, reg_idx, reg_idx, asdf),
               "object 'asdf' not found for lambda")

  # pos_only arg a nonexistent object
  expect_error(rankEN(filterMS_obj, bioact, reg_idx, reg_idx, lambda, asdf),
               "object 'asdf' not found for pos_only")

  # ncomp arg a nonexistent object
  expect_error(rankEN(filterMS_obj, bioact, reg_idx, reg_idx, lambda, , asdf),
               "object 'asdf' not found for ncomp")
})




# ``````````````````````````````` #
#  Argument is of the wrong type  #
# ............................... #

test_that("rankEN: argument of wrong type", {

  # msObj of wrong type: a matrix
  expect_error(rankEN(matrix(nrow=200, ncol=50), bioact, reg_idx, reg_idx, lambda),
               "msObj must be of class \"msDat\"")

  # msObj of wrong type: an msDat object with class attribute renamed
  expect_error(rankEN(structure(msDatObj, class="asdf"), bioact, reg_idx, reg_idx, lambda),
               "msObj must be of class \"msDat\"")

  # bioact of wrong type: 3-d array
  expect_error(rankEN(msDatObj, array(1, dim=1:3), reg_idx, reg_idx, lambda),
               "If of mode numeric, then bioact must be a vector or a matrix")

  # region_ms of wrong type: logical vector
  expect_error(rankEN(msDatObj, bioact, (rnorm(10) > 0), reg_idx, lambda),
               "region_ms must be either NULL or either of mode numeric or character")

  # region_bio of wrong type: list
  expect_error(rankEN(msDatObj, bioact, reg_idx, list(1, 2), lambda),
               "region_bio must be either NULL or either of mode numeric or character")

  # lambda of wrong type: logical
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx, TRUE),
               "lambda must be a numeric value")

  # pos_only of wrong type: list
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx, lambda, list()),
               "pos_only must be either TRUE or FALSE")

  # ncomp of wrong type: closure
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx, lambda, TRUE, sum),
               "ncomp must be either NULL or a numeric value")
})




# ````````````````````````````````````````` #
#  Argument of the right type but with NAs  #
# ......................................... #

test_that("rankEN: right type but with NAs", {

  # bioact NA (in region of interest)
  expect_error(rankEN(msDatObj, bio_NA, reg_idx, reg_idx, lambda),
               "bioact cannot have any missing in the region provided by region_bio")

  # region_ms NA
  expect_error(rankEN(msDatObj, bioact, replace(reg_idx, 1L, NA), reg_idx, lambda),
               "region_ms cannot contain any missing")

  # region_bio NA
  expect_error(rankEN(msDatObj, bioact, reg_idx, replace(reg_idx, 1L, NA), lambda),
               "region_bio cannot contain any missing")

  # lambda NA
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx, NA_real_),
               "lambda cannot contain any missing")

  # pos_only NA
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx, lambda, NA),
               "pos_only must be either TRUE or FALSE")

  # ncomp NA
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx, lambda, TRUE, NA_real_),
               "If non-NULL then ncomp cannot contain any missing")
})




# ``````````````````````````````` #
#  Right type but illegal values  #
# ............................... #

test_that("rankEN: right type but illegal values", {

  # Note: assume that if msObj inherits from msDat then the data contained
  # within is valid

  # bioact: 0 column matrix
  expect_error(rankEN(msDatObj, bioact[, integer(0L)], reg_idx, reg_idx, lambda),
               "bioact must have number of columns no less than 2")

  # bioact: 1 column data.frame
  expect_error(rankEN(msDatObj, bio_df[, reg_idx[1L], drop=FALSE], reg_idx, reg_idx, lambda),
               "bioact must have number of columns no less than 2")

  # bioact: give a vector with length < 2
  expect_error(rankEN(msDatObj, 99, reg_idx, reg_idx, lambda),
               "If a numeric vector, then bioact must have length >= 2")

  # region_ms: length 0
  expect_error(rankEN(msDatObj, bioact, integer(0L), reg_idx, lambda),
               "If non-NULL, then region_ms must have length no less than 1")

  # region_ms: names not in msObj names
  expect_error(rankEN(msDatObj, bioact, c("ms21", "qwer"), reg_idx, lambda),
               "column names in ms do not contain qwer element in region_ms")

  # region_ms: duplicate names
  expect_error(rankEN(msDatObj, bioact, c("ms21", "ms21", "ms22"), reg_idx, lambda),
               "region_ms cannot have any duplicate values")

  # region_ms: ambiguous names
  expect_error(rankEN(msDatObj, bioact, c("ms21", "ms22", "ms"), reg_idx, lambda),
               "name provided had multiple matches in data - ms element in region_ms")

  # region_bio: length 0
  expect_error(rankEN(msDatObj, bioact, reg_idx, integer(0L), lambda),
               "If non-NULL, then region_bio must have length no less than 1")

  # region_bio: index too small
  expect_error(rankEN(msDatObj, bioact, reg_idx, c(reg_idx, 0L), lambda),
               "out of bounds index 0 provided for region_bio relative to bioact")

  # region_bio: index too large
  expect_error(rankEN(msDatObj, bioact, reg_idx, c(reg_idx, 999L), lambda),
               "out of bounds index 999 provided for region_bio relative to bioact")

  # lambda: negative value
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx, -1),
               "lambda cannot be smaller than 0")

  # lambda: length 0
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx, numeric(0L)),
               "lambda must be an atomic vector of length 1")

  # lambda: length 2
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx, c(1, 2)),
               "lambda must be an atomic vector of length 1")

  # Note: pos_only can only be TRUE or FALSE so there is nothing to check in
  # this category

  # lambda: negative value
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx, 0.1, TRUE, 0.4),
               "If non-NULL then ncomp must be >= 1")

  # lambda: length 0
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx, 0.1, TRUE, integer(0L)),
               "If non-NULL then ncomp must be an atomic vector of length 1")

  # lambda: length 2
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx, 0.1, TRUE, c(1, 2)),
               "If non-NULL then ncomp must be an atomic vector of length 1")

  # region_ms, region_bio: lengths don't match
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx[-1L], lambda),
               paste0("Number of fractions for mass spectrometry (10) does not ",
                      "match the number of fractions for bioactivity (9)"), fixed=TRUE )

  # region_ms, region_bio: lengths don't match
  expect_error(rankEN(msDatObj, bioact, reg_idx, reg_idx[-1L], lambda),
               paste0("Number of fractions for mass spectrometry (10) does not ",
                      "match the number of fractions for bioactivity (9)"), fixed=TRUE )

  # bioact, region_bio: char in selected data
  expect_error(rankEN(msDatObj, bio_NA, reg_idx, reg_idx, lambda),
               "bioact cannot have any missing in the region provided by region_bio")
})
