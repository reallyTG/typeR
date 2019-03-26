
# Note: since extract_idx and extract_var are not user-level functions, we
# assume that we have already checked for argument missingness / existence in
# the calling function (and hence do not check for these issues in any of the
# routines in the Extract_Var.R file).

# ``````````````````` #
#  Load testing data  #
# ................... #

# See tests/construct-data/cd-extract.R for the file used to create the data
load(file.path("..", "data", "data-extract.RData"))




# `````````````````````````````` #
#  extract_idx with valid input  #
# .............................. #

context("extract_idx method")

test_that("extract_idx: valid input with various forms", {

  # Tests are described in terms of their input to var_specify

  # numeric length 1: integer
  expect_identical( extract_idx(obs, 1L), 1L )
  # numeric length 1: integer with names attribute
  expect_identical( extract_idx(obs, setNames(1L, "xyz")), 1L )
  # numeric length 1: double
  expect_identical( extract_idx(obs, 1), 1L )
  # numeric length 1: double not approximately an integer
  expect_identical( extract_idx(obs, 1.3), 1L )
  # numeric length > 1: integer
  expect_identical( extract_idx(obs, var_idx, TRUE), c(2L, 4L) )
  # numeric length > 1: integer (data_obs a data.frame)
  expect_identical( extract_idx(obs_df, var_idx, TRUE), c(2L, 4L) )
  # numeric length 1: specify as a matrix
  expect_identical( extract_idx(obs, 1L, TRUE), 1L )

  # character length 1: name
  expect_identical( extract_idx(obs, "var1"), 1L )
  # character length 1: specify as a matrix
  expect_identical( extract_idx(obs, "var2", TRUE), 2L )
  # character length 1: vector with names attribute
  expect_identical( extract_idx(obs, setNames("var1", "xyz")), 1L )
  # character length > 1: names
  expect_identical( extract_idx(obs, var_nm, TRUE), c(2L, 4L) )
  # character length > 1: names (data_obs a data.frame)
  expect_identical( extract_idx(obs_df, var_nm, TRUE), c(2L, 4L) )

  # NULL: no other vars to dot-dot-dot
  expect_identical( extract_idx(obs, NULL, TRUE), 1:5 )
  # NULL: single numeric vector to dot-dot-dot
  expect_identical( extract_idx(obs, NULL, TRUE, var_idx_remain), c(2L, 4L) )
  # NULL: multiple numeric vectors to dot-dot-dot
  expect_identical( extract_idx(obs, NULL, TRUE, 1, 2.5, pi, 4L), 5L )
  # NULL: single character vector to dot-dot-dot
  expect_identical( extract_idx(obs, NULL, TRUE, var_nm_remain), c(2L, 4L) )
  # NULL: a numeric vector and a character vector to dot-dot-dot
  expect_identical( extract_idx(obs, NULL, TRUE, 2, var_nm_remain), 4L )
  # NULL: with vars passed to dot-dot-dot (data_obs a data.frame)
  expect_identical( extract_idx(obs_df, NULL, TRUE, 2, var_nm_remain), 4L )
})




# `````````````````````````````````````` #
#  extract_idx with input of wrong type  #
# ...................................... #

test_that("extract_idx: input of the wrong type", {

  wrong_type <- Sys.Date()

  # data_obs wrong type
  expect_error(extract_idx(wrong_type, col_idx),
               "wrong_type must be a matrix or data.frame")

  # var_specify wrong type
  expect_error(extract_idx(obs, wrong_type),
               "wrong_type must either be NULL or either of mode numeric or mode character")

  # expect_matr wrong type
  expect_error(extract_idx(obs, var_idx, wrong_type),
               "expect_matr must be either TRUE or FALSE")

  # dot-dot-dot arg wrong type (first arg)
  expect_error(extract_idx(obs, NULL, TRUE, wrong_type),
               "remove_var must either be of mode numeric or mode character")

  # dot-dot-dot arg wrong type (second arg)
  expect_error(extract_idx(obs, NULL, TRUE, var_idx_remain, wrong_type),
               "remove_var must either be of mode numeric or mode character")
})




# ````````````````````````````````````` #
#  extract_idx with illegal arg values  #
# ..................................... #

test_that("extract_idx: right type but illegal values", {

  # data_obs: 0 row matrix
  expect_error(extract_idx(obs_zero_row, col_idx, TRUE),
               "obs_zero_row must have number of rows no less than 1")

  # data_obs: 0 row data.frame
  expect_error(extract_idx(obs_zero_row_df, col_idx, TRUE),
               "obs_zero_row_df must have number of rows no less than 1")

  # note: 1-row matrices allowed, in contrast to 1-column matrices

  # data_obs: 0 col matrix
  expect_error(extract_idx(obs_zero_col, col_idx, TRUE),
               "obs_zero_col must have number of columns no less than 2")

  # data_obs: 1 col matrix
  expect_error(extract_idx(obs_one_col, col_idx, TRUE),
               "obs_one_col must have number of columns no less than 2")

  # note: we don't check data_obs for valid values (i.e. no NAs or non-numeric
  # entries) with extract_idx because we never subset the data.  In other words,
  # if the data is needed then the checking will presumably occur when it is
  # extracted, via some other function.

  # var_specify: zero-length (numeric)
  expect_error(extract_idx(obs, var_idx_zero_len),
               "If non-NULL, then var_idx_zero_len must have length no less than 1")

  # var_specify: zero-length (character)
  expect_error(extract_idx(obs, var_nm_zero_len),
               "If non-NULL, then var_nm_zero_len must have length no less than 1")

  # var_specify: index too small
  expect_error( extract_idx(obs, var_idx_too_small, TRUE),
               "out of bounds index -1 provided for var_idx_too_small relative to obs")

  # var_specify: index too big
  expect_error( extract_idx(obs, var_idx_too_big, TRUE),
               "out of bounds index 100 provided for var_idx_too_big relative to obs")

  # var_specify: name doesn't match any in data_obs column names
  expect_error(extract_idx(obs, var_nm_nomatch, TRUE),
               "column names in obs do not contain varxyz element in var_nm_nomatch")

  # var_specify: duplicates (numeric)
  expect_error(extract_idx(obs, var_idx_dups, TRUE),
               "var_idx_dups cannot have any duplicate values")

  # var_specify: duplicates (character)
  expect_error(extract_idx(obs, var_nm_dups, TRUE),
               "var_nm_dups cannot have any duplicate values")

  # var_specify: wrong length wrt expect_matr
  expect_error(extract_idx(obs, var_idx),
               "var_idx must have length 1 or length equal to the number of observations")

  # var_specify NA's
  expect_error(extract_idx(obs, var_idx_NA),
               "var_idx_NA cannot contain any missing")
})




# `````````````````````````````` #
#  extract_var with valid input  #
# .............................. #

context("extract_var method")

test_that("extract_var: valid input with various forms", {

  # numeric length 1
  expect_identical( extract_var(obs, 1L), obs[, 1L] )
  # numeric length 1: return matrix
  expect_identical( extract_var(obs, 1L, TRUE), obs[, 1, drop=FALSE] )
  # numeric length > 1
  expect_identical( extract_var(obs, var_idx, TRUE), obs[, var_idx] )
  # numeric length > 1 (data_obs a data.frame)
  expect_identical( extract_var(obs_df, var_idx, TRUE), obs[, var_idx] )
  # numeric length > 1: NAs outside extraction region
  expect_identical( extract_var(obs_NA_out, var_idx, TRUE), obs[, var_idx] )

  # character length 1
  expect_identical( extract_var(obs, "var2"), obs[, 2L] )
  # character length 1: return matrix
  expect_identical( extract_var(obs, "var3", TRUE), obs[, 3, drop=FALSE] )
  # character length > 1
  expect_identical( extract_var(obs, var_nm, TRUE), obs[, var_idx] )
  # character length > 1 (data_obs a data.frame)
  expect_identical( extract_var(obs_df, var_nm, TRUE), obs[, var_idx] )
  # character length > 1: NAs outside extraction region
  expect_identical( extract_var(obs_NA_out, var_nm, TRUE), obs[, var_idx] )

  # NULL: use all obs
  expect_identical( extract_var(obs, NULL, TRUE), obs )
  # NULL: dot-dot-dot a numeric vector
  expect_identical( extract_var(obs, NULL, TRUE, var_idx_remain), obs[, var_idx] )
  # NULL: dot-dot-dot multiple numeric vectors
  expect_identical( extract_var(obs, NULL, TRUE, 1.5, pi, 5L), obs[, var_idx] )
  # NULL: dot-dot-dot a character vector
  expect_identical( extract_var(obs, NULL, TRUE, var_nm_remain), obs[, var_idx] )
  # NULL: dot-dot-dot a character vector (data_obs a data.frame)
  expect_identical( extract_var(obs_df, NULL, TRUE, var_nm_remain), obs[, var_idx] )
  # NULL: dot-dot-dot a character vector (data_obs a data.frame with missing)
  expect_identical( extract_var(obs_df, NULL, TRUE, var_nm_remain), obs[, var_idx] )
  # NULL: dot-dot-dot both numeric and character
  expect_identical( extract_var(obs, NULL, TRUE, c(1, 5), "var3"), obs[, var_idx] )

  # data passed to var_specify
  expect_identical( extract_var(obs, var2), var2 )
  # data the same length as the data matrix AND expect_matr=FALSE
  expect_identical( extract_var(obs_short, 2:4), 2:4 )
  # data the same length as the data matrix AND expect_matr=TRUE
  expect_identical( extract_var(obs_short, 2:4, TRUE), obs_short[, 2:4] )
})

# Note: compare the last two tests.  These pair constitute a delicate case, that
# being the task of disambiguating when we are being handed data or indices to
# var_specify when the length of var_specify is the same as that of data_obs.
# The solution is that when the variable we are trying to extract is supposed to
# be vector, then we know we've been given data, but if it's supposed to be a
# matrix, then we aren't supposed to be given data so we conclude that they must
# be indices.  Note that this doesn't work for the case when data_obs is
# 1-dimensional and we variable is supposed to be a vector - thus we are not
# allowed to use extract_var in this case.




# ````````````````````````````````````` #
#  extract_var with illegal arg values  #
# ..................................... #

# Regarding error-checking for extract_var:
#
# extract_var can be thought of as a wrapper for extract_idx, with an added step
# that returns the data.  Basically extract_var gets the indices with which to
# subset the data by using the same subroutines as extract_idx, and once the
# indexes have been obtained then the data is simply subset from data_obs.
# Because of this construction, we do not need to re-perform the error-checking
# that was done for extract_idx.
#
# If the construction of extract_var changes in future then we should
# reconsider.


test_that("extract_idx: right type but illegal values", {

  # NA in data_obs: var_specify NULL
  expect_error(extract_var(obs_NA_out, NULL, TRUE),
               "obs_NA_out cannot have any missing in the region provided by NULL")

  # NA in data_obs: var_specify numeric
  expect_error(extract_var(obs_NA_out, var_idx_remain, TRUE),
               "obs_NA_out cannot have any missing in the region provided by var_idx_remain")

  # non-numeric in data_obs: var_specify numeric
  expect_error(extract_var(obs_char_in, var_idx, TRUE),
               "obs_char_in cannot have any non-numeric in the region provided by var_idx")
})
