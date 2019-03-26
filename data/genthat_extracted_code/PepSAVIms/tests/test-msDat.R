
# ``````````````````` #
#  Load testing data  #
# ................... #

# See construct-data/cd-filterMS.R for the file used to create the data
load(file.path("..", "data", "data-msDat.RData"))




# `````````````````````````````````````````````````` #
#  Valid input with various argument specifications  #
# .................................................. #

context("msDat constructor")


test_that("msDat:  test with valid input  --  ms_inten non-NULL section", {

  # mtoz: indices  --  charge: indices  --  ms_inten: indices
  expect_identical(msDat(ms_mat, mtoz_idx, chg_idx, inten_idx), trueDat)

  # mtoz: names  --  charge: names  --  ms_inten: names
  expect_identical(msDat(ms_mat, mtoz_nm, chg_nm, inten_nm), trueDat)

  # mtoz: names  --  charge: names  --  ms_inten: names (one column only ms)
  expect_identical(msDat(ms_mat, mtoz_nm, chg_data, inten_nm[1L]), true_one_col)

  # mtoz: data  --  charge: data  --  ms_inten: indices
  expect_identical(msDat(ms_mat, mtoz_data, chg_data, inten_idx), trueDat)

  # mtoz: indices  --  charge: names  --  ms_inten: indices
  expect_identical(msDat(ms_mat, mtoz_idx, chg_nm, inten_idx), trueDat)

  # mtoz: names  --  charge: indices  --  ms_inten: names
  expect_identical(msDat(ms_mat, mtoz_nm, chg_idx, inten_nm), trueDat)

  # mtoz: names  --  charge: data  --  ms_inten: indices
  expect_identical(msDat(ms_mat, mtoz_nm, chg_data, inten_idx), trueDat)
})


test_that("msDat:  test with valid input  --  ms_inten as NULL section", {

  # mtoz: indices  --  charge: indices  --  ms_inten: NULL
  expect_identical(msDat(ms_red, mtoz_idx, chg_idx, NULL), trueDat)

  # mtoz: names  --  charge: names  --  ms_inten: NULL
  expect_identical(msDat(ms_red, mtoz_nm, chg_nm, NULL), trueDat)

  # mtoz: data  --  charge: name  --  ms_inten: NULL
  expect_identical(msDat(ms_red[, -mtoz_idx], mtoz_data, chg_nm, NULL), trueDat)

  # mtoz: name  --  charge: data  --  ms_inten: NULL
  expect_identical(msDat(ms_red[, -chg_idx], mtoz_nm, chg_data, NULL), trueDat)

  # mtoz: data  --  charge: data  --  ms_inten: NULL
  expect_identical(msDat(ms_red[, -c(mtoz_idx, chg_idx)], mtoz_data, chg_data, NULL), trueDat)
})


test_that("msDat:  test with valid input  --  mass_spec as data.frame section", {

  ## Don't redo all tests but just pick a sample from the previous tests

  # mtoz: names  --  charge: indices  --  ms_inten: names
  expect_identical(msDat(ms_df, mtoz_nm, chg_idx, inten_nm), trueDat)

  # mtoz: names  --  charge: data  --  ms_inten: indices
  expect_identical(msDat(ms_df, mtoz_nm, chg_data, inten_idx), trueDat)

  # mtoz: name  --  charge: data  --  ms_inten: NULL
  expect_identical(msDat(ms_red_df[, -chg_idx], mtoz_nm, chg_data, NULL), trueDat)
})




# ``````````````````````````` #
#  Missing param for formals  #
# ........................... #

test_that("msDat: missing input", {

  # mass_spec missing
  expect_error( msDat( , 1L, 2L, 3:5), "Must provide an argument for mass_spec" )
  # mtoz missing
  expect_error( msDat(ms_mat, , 2L, 3:5), "Must provide an argument for mtoz" )
  # charge missing
  expect_error( msDat(ms_mat, 1L, , 3:5), "Must provide an argument for charge" )

  # Note: ms_inten has a default argument
})




# ```````````````````````````````` #
#  Argument is nonexistent object  #
# ................................ #

test_that("msDat: nonexistent object", {

  # mass_spec arg a nonexistent object
  expect_error( msDat(asdf, 1L, 2L, 3:5), "object \'asdf\' not found for mass_spec" )
  # mtoz arg a nonexistent object
  expect_error( msDat(ms_mat, asdf, 2L, 3:5), "object \'asdf\' not found for mtoz" )
  # charge arg a nonexistent object
  expect_error( msDat(ms_mat, 1L, asdf, 3:5), "object \'asdf\' not found for charge")
  # ms_inten arg a nonexistent object
  expect_error( msDat(ms_mat, 1L, 2L, asdf), "object \'asdf\' not found for ms_inten" )
})




# ``````````````````````` #
#  Argument contains NAs  #
# ....................... #

test_that("msDat: NAs in argument", {

  # Note: we don't initially check ms_mat for NA's until after data has been
  # extracted from it.  A test for this is performed elsewhere.

  # mtoz contains NA's
  expect_error(msDat(ms_mat, NA_real_, 2L, 3:5),
               "mtoz cannot contain any missing" )

  # charge contains NA's
  expect_error(msDat(ms_mat, 1L, NA_character_, 3:5),
               "charge cannot contain any missing" )

  # ms_inten contains NA's
  expect_error(msDat(ms_mat, 1L, 2L, c(3L, NA_integer_, 5L)),
               "ms_inten cannot contain any missing" )
})




# ``````````````````````````````` #
#  Argument is of the wrong type  #
# ............................... #

test_that("rankEN: argument of wrong type", {

  # mass_spec: list
  expect_error(msDat(list(), 1L, 2L, 3:5),
               "mass_spec must be either a matrix or data.frame")

  # mass_spec: 3-d array
  expect_error(msDat(array(dim=1:3), list(), 2L, 3:5),
               "mass_spec must be either a matrix or data.frame")

  # mtoz: logical vector
  expect_error(msDat(ms_mat, logical(1L), 2L, 3:5),
               "mtoz must be either of mode numeric or character")

  # charge: list
  expect_error(msDat(ms_mat, 1L, list(), 3:5),
               "charge must be either of mode numeric or character")

  # ms_inten: list
  expect_error(msDat(ms_mat, 1L, 2L, list()),
               "ms_inten must be either NULL or of mode numeric or character")
})




# ``````````````````````````````` #
#  Right type but illegal values  #
# ............................... #

test_that("msDat: right type but illegal values  --  mass_spec", {

  # mass_spec: 0 columns
  expect_error(msDat(ms_mat[, integer(0)], mtoz_nm, chg_nm, inten_nm),
               "mass_spec cannot have 0 columns")

  # mass_spec: 0 rows
  expect_error(msDat(ms_mat[integer(0), ], mtoz_nm, chg_nm, inten_nm),
               "mass_spec must have 2 or more rows")

  # mass_spec: 1 row
  expect_error(msDat(ms_mat[1L, , drop=FALSE], mtoz_nm, chg_nm, inten_nm),
               "mass_spec must have 2 or more rows")

  # mass_spec: 0 cols of data after removing mtoz and charge
  expect_error(msDat(ms_mat[, c("mtoz", "chg")], "mtoz", "chg", NULL),
               paste0("There must be at least 2 columns left for mass_spec ",
                      "after removing data for other variables"))

  # mass_spec: 1 col of data after removing mtoz and charge
  expect_error(msDat(ms_mat[, c("mtoz", "chg", "ms1")], "mtoz", "chg", NULL),
               paste0("There must be at least 2 columns left for mass_spec ",
                      "after removing data for other variables"))
})


test_that("msDat: right type but illegal values  --  mtoz", {

  # mtoz: length 0
  expect_error(msDat(ms_mat, integer(0L), chg_nm, inten_nm),
               "If non-NULL, then mtoz must have length no less than 1")

  # mtoz: length 2
  expect_error(msDat(ms_mat, c("junk1", "junk2"), chg_nm, inten_nm),
               "mtoz must have length 1 or length equal to the number of observations")

  # mtoz: invalid index 0
  expect_error(msDat(ms_mat, 0, chg_nm, inten_nm),
               "out of bounds index 0 provided for mtoz relative to mass_spec")

  # mtoz: invalid index 1000
  expect_error(msDat(ms_mat, 1000, chg_nm, inten_nm),
               "out of bounds index 1000 provided for mtoz relative to mass_spec")

  # mtoz: invalid name "wrong_name"
  expect_error(msDat(ms_mat, "wrong_name", chg_nm, inten_nm),
               "column names in mass_spec do not contain wrong_name element in mtoz")

  # mtoz: ambiguous name "m"
  expect_error(msDat(ms_mat, c("m"), chg_nm, inten_nm),
               "name provided had multiple matches in data - m element in mtoz")
})


test_that("msDat: right type but illegal values  --  charge", {

  # charge: length 0
  expect_error(msDat(ms_mat, mtoz_nm, integer(0L), inten_nm),
               "If non-NULL, then charge must have length no less than 1")

  # charge: length 2
  expect_error(msDat(ms_mat, mtoz_nm, c("junk1", "junk2"), inten_nm),
               "charge must have length 1 or length equal to the number of observations")

  # charge: invalid index 0
  expect_error(msDat(ms_mat, mtoz_nm, 0, inten_nm),
               "out of bounds index 0 provided for charge relative to mass_spec")

  # charge: invalid index 1000
  expect_error(msDat(ms_mat, mtoz_nm, 1000, inten_nm),
               "out of bounds index 1000 provided for charge relative to mass_spec")

  # charge: invalid name "wrong_name"
  expect_error(msDat(ms_mat, mtoz_nm, "wrong_name", inten_nm),
               "column names in mass_spec do not contain wrong_name element in charge")

  # charge: ambiguous name "m"
  expect_error(msDat(ms_mat, mtoz_nm, c("m"), inten_nm),
               "name provided had multiple matches in data - m element in charge")
})


test_that("msDat: right type but illegal values  --  ms_inten", {

  # ms_inten: length 0
  expect_error(msDat(ms_mat, mtoz_nm, chg_nm, character(0L)),
               "If non-NULL, then ms_inten must have length no less than 1")

  # ms_inten: invalid index 100
  expect_error(msDat(ms_mat, mtoz_nm, chg_nm, c(3L, 4L, 100L)),
               "out of bounds index 100 provided for ms_inten relative to mass_spec")

  # ms_inten: invalid name "wrong_name"
  expect_error(msDat(ms_mat, mtoz_nm, chg_nm, c("wrong_name", "ms2", "ms3")),
               "column names in mass_spec do not contain wrong_name element in ms_inten")

  # ms_inten: duplicate names "ms1"
  expect_error(msDat(ms_mat, mtoz_nm, chg_nm, c("ms1", "ms1", "ms3")),
               "ms_inten cannot have any duplicate values")

  # ms_inten: ambiguous name "ms"
  expect_error(msDat(ms_mat, mtoz_nm, chg_nm, c("ms", "ms2", "ms3")),
               "name provided had multiple matches in data - ms element in ms_inten")
})


test_that("msDat: right type but illegal values  --  missing or wrong type in extracted", {

  # NA's in the data specified for mtoz
  expect_error(msDat(ms_mat, "junk1", chg_nm, inten_nm),
               "mass_spec cannot have any missing in the region provided by mtoz")

  # character in the region specified for charge
  expect_error(msDat(ms_df, mtoz_nm, "junk3", inten_nm),
               "mass_spec cannot have any non-numeric in the region provided by charge")

  # character in the region specified for ms_inten
  expect_error(msDat(ms_df, mtoz_nm, chg_nm, c(inten_nm, "junk3")),
               "mass_spec cannot have any non-numeric in the region provided by ms_inten")

  # Leave less than two columns for ms_inten
  expect_error(msDat(ms_red[, -(4:5)], mtoz_nm, chg_nm, NULL),
               paste0("There must be at least 2 columns left for mass_spec ",
                      "after removing data for other variables"))
})
