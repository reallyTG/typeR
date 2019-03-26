
# ``````````````````` #
#  Load testing data  #
# ................... #

# See construct-data/cd-binMS.R for the file used to sample / create the data
load(file.path("..", "data", "data-binMS.RData"))




# ```````````````````````````````````````` #
#  Valid input with various types of data  #
# ........................................ #


context("binMS method")

test_that("binMS: compare results with various methods of providing / specifying data", {

  # Specify data by name
  out <- binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
               c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1)
  expect_equal( out, true_bin )

  # Specify data by index
  out <- binMS(testMS, 1, 2, 4, 3, c(5, 6), c(14, 45),
               c(2e3, 15e3), c(2, 10), 0.05, 1)
  expect_equal( out, true_bin )

  # Provide data as vectors
  out <- binMS(testMS, testMS[, "mtoz"], testMS[, "chg"], testMS[, "mass"], testMS[, "time"],
               c("ms1", "ms2"), c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1)
  expect_equal( out, true_bin )

  # Specify data by a mix of indices and names
  out <- binMS(testMS, 1, 2, "mass", "time", c("ms1", "ms2"), c(14, 45),
               c(2e3, 15e3), c(2, 10), 0.05, 1)
  expect_equal( out, true_bin )

  # Specify / provide data by a mix of indices and names and data vectors
  out <- binMS(testMS, 1, 2, "mass", testMS[, "time"], c("ms1", "ms2"), c(14, 45),
               c(2e3, 15e3), c(2, 10), 0.05, 1)
  expect_equal( out, true_bin )

  # Specify ms data by NULL
  out <- binMS(testMS[, 1:n_datacols], "mtoz", "chg", "mass", "time", NULL,
               c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1)
  expect_equal( out, true_bin )

  # Specify data by a mix of indices and names and ms data by NULL
  out <- binMS(testMS[, 1:n_datacols], 1, 2, "mass", "time", NULL, c(14, 45),
               c(2e3, 15e3), c(2, 10), 0.05, 1)
  expect_equal( out, true_bin )

  # Test data as a data.frame and specify data by name
  out <- binMS(testdf, 1, 2, "mass", "time", c("ms1", "ms2"), c(14, 45),
               c(2e3, 15e3), c(2, 10), 0.05, 1)
  expect_equal( out, true_bin )

  # Test data as a data.frame and specify data by index
  out <- binMS(testdf, 1, 2, 4, 3, c(5, 6), c(14, 45),
               c(2e3, 15e3), c(2, 10), 0.05, 1)
  expect_equal( out, true_bin )

  # Test data as a data.frame and provide data as vectors
  out <- binMS(testdf, testdf[, "mtoz"], testdf[, "chg"], testdf[, "mass"], testdf[, "time"],
               c("ms1", "ms2"), c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1)
  expect_equal( out, true_bin )

  # Test data as a data.frame and specify data by a mix of indices and names
  out <- binMS(testdf, 1, 2, "mass", "time", c("ms1", "ms2"), c(14, 45),
               c(2e3, 15e3), c(2, 10), 0.05, 1)
  expect_equal( out, true_bin )

  # Test data as a data.frame and specify / provide data by a mix of indices and
  # names and data vectors
  out <- binMS(testdf, 1, 2, "mass", testdf[, "time"], c("ms1", "ms2"), c(14, 45),
               c(2e3, 15e3), c(2, 10), 0.05, 1)
  expect_equal( out, true_bin )

  # Specify minimum value for charge such that no observations meets criterion
  expect_warning(out <- binMS(testMS, 1, 2, "mass", "time", NULL,
                              c(14, 45), c(2e3, 15e3), c(20, 100), 0.05, 1),
                 "No observations satisfied all of the inclusion criteria")
  expect_identical( out$msObj, NULL )
})




# ``````````````````````````` #
#  Missing param for formals  #
# ........................... #


# Note that the formal arguments mass and ms_inten have defaults

test_that("binMS: with missing params", {

  # Missing mass_spec
  expect_error( binMS( , "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                      c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
                "Must provide an argument for mass_spec" )

  # Missing mtoz
  expect_error( binMS(testMS, , "chg", "mass", "time", c("ms1", "ms2"),
                      c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
                "Must provide an argument for mtoz" )

  # Missing charge
  expect_error( binMS(testMS, "mtoz", , "mass", "time", c("ms1", "ms2"),
                      c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "Must provide an argument for charge" )

  # Missing time_peak_reten
  expect_error( binMS(testMS, "mtoz", "chg", "mass", , c("ms1", "ms2"),
                      c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
                "Must provide an argument for time_peak_reten" )

  # Missing time_range
  expect_error( binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                      , c(2e3, 15e3), c(2, 10), 0.05, 1),
                "Must provide an argument for time_range" )

  # Missing mass_range
  expect_error( binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                      c(14, 45), , c(2, 10), 0.05, 1),
                "Must provide an argument for mass_range" )

  # Missing charge_range
  expect_error( binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                      c(14, 45), c(2e3, 15e3), , 0.05, 1),
                "Must provide an argument for charge_range" )

  # Missing mtoz_diff
  expect_error( binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                      c(14, 45), c(2e3, 15e3), c(2, 10), , 1),
                "Must provide an argument for mtoz_diff" )

  # Missing time_diff
  expect_error( binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                      c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, ),
                "Must provide an argument for time_diff" )
})




# ```````````````````````````````` #
#  Argument is nonexistent object  #
# ................................ #


test_that("binMS: argument is nonexistent object", {

  # mass_spec arg a nonexistent object
  expect_error(binMS(asdf, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "object 'asdf' not found for mass_spec")

  # mtoz arg a nonexistent object
  expect_error(binMS(testMS, asdf, "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "object 'asdf' not found for mtoz")

  # charge arg a nonexistent object
  expect_error(binMS(testMS, "mtoz", asdf, "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "object 'asdf' not found for charge")

  # mass arg a nonexistent object
  expect_error(binMS(testMS, "mtoz", "chg", asdf, "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "object 'asdf' not found for mass")

  # time_peak_reten arg a nonexistent object
  expect_error(binMS(testMS, "mtoz", "chg", "mass", asdf, c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "object 'asdf' not found for time_peak_reten")

  # ms_inten arg a nonexistent object
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", asdf,
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "object 'asdf' not found for ms_inten")

  # time_range arg a nonexistent object
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     asdf, c(2e3, 15e3), c(2, 10), 0.05, 1),
               "object 'asdf' not found for time_range")

  # mass_range arg a nonexistent object
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), asdf, c(2, 10), 0.05, 1),
               "object 'asdf' not found for mass_range")

  # charge_range arg a nonexistent object
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), asdf, 0.05, 1),
               "object 'asdf' not found for charge_range")

  # mtoz_diff arg a nonexistent object
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), asdf, 1),
               "object 'asdf' not found for mtoz_diff")

  # time_diff arg a nonexistent object
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, asdf),
               "object 'asdf' not found for time_diff")
})




# ````````````````````` #
#  Wrong argument type  #
# ..................... #


test_that("binMS: wrong types of arguments", {

  # Wrong type for mass_spec
  expect_error(binMS(list(), "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "mass_spec must be either a matrix or data.frame")

  # Wrong type for mtoz
  expect_error(binMS(testMS, mtoz=list(), "chg", "mass", "time",
                     c("ms1", "ms2"), c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "mtoz must be either of mode numeric or character")

  # Wrong type for charge
  expect_error(binMS(testMS, "mtoz", list(), "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "charge must be either of mode numeric or character")

  # Wrong type for mass
  expect_error(binMS(testMS, "mtoz", "chg", list(), "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "mass must be either NULL or of mode numeric or character")

  # Wrong type for time_peak_reten
  expect_error(binMS(testMS, "mtoz", "chg", "mass", list(), c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "time_peak_reten must be either of mode numeric or character")

  # Wrong type for ms_inten
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", list(),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "ms_inten must be either NULL or of mode numeric or character")

  # Wrong type for time_range
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     list(), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "time_range must be of mode numeric")

  # Wrong type for mass_range
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), list(), c(2, 10), 0.05, 1),
               "mass_range must be of mode numeric")

  # Wrong type for charge_range
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), list(), 0.05, 1),
               "charge_range must be of mode numeric")

  # Wrong type for mtoz_diff
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), list(), 1),
               "mtoz_diff must be of mode numeric")

  # Wrong type for time_diff
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, list()),
               "time_diff must be of mode numeric")
})




# `````````````````````````````` #
#  Args of the wrong dimensions  #
# .............................. #


test_that("binMS: arguments of the wrong dimensions", {

  # mass_spec with 0 rows
  expect_error(binMS(testMS[integer(0), ], "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "mass_spec must have number of rows no less than 1")

  # mass_spec with 1 column
  expect_error(binMS(testMS[, integer(1)], "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "mass_spec must have number of columns no less than 2")

  # mass_spec with 2 columns
  expect_error(binMS(testMS[, 1L, drop=FALSE], "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "mass_spec must have number of columns no less than 2")

  # mtoz length 0 numeric vector
  expect_error(binMS(testMS, integer(0), "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "If non-NULL, then mtoz must have length no less than 1")

  # charge length 0 character vector
  expect_error(binMS(testMS, "mtoz", character(0), "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "If non-NULL, then charge must have length no less than 1")

  # mass numeric vector of wrong length
  expect_error(binMS(testMS, "mtoz", "chg", c(1, 2), "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "mass must have length 1 or length equal to the number of observations")

  # time numeric vector of wrong length
  expect_error(binMS(testMS, "mtoz", "chg", "mass", c(1, 2), c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "time_peak_reten must have length 1 or length equal to the number of observations")

  # ms_inten length 0 character vector
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", character(0),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "If non-NULL, then ms_inten must have length no less than 1")

  # time_range with wrong length
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(1, 2, 3), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "time_range must have a length of 2")

  # mass_range with wrong length
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), 1, c(2, 10), 0.05, 1),
               "mass_range must have a length of 2")

  # charge_range with wrong length
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), numeric(0), 0.05, 1),
               "charge_range must have a length of 2")

  # mtoz_diff with wrong length
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), c(1, 2), 1),
               "mtoz_diff must have a length of 1")

  # time_diff with wrong length
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, numeric(0)),
               "time_diff must have a length of 1")

  # 0 cols in mass_spec for mass spectrometry abundance data
  expect_error(binMS(testMS[, 1:4], "mtoz", "chg", "mass", "time", NULL,
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               paste0("There must be at least 2 columns left for mass_spec ",
                      "after removing data for other variables"))

  # 1 col in mass_spec for mass spectrometry abundance data
  expect_error(binMS(testMS[, 1:5], "mtoz", "chg", "mass", "time", NULL,
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               paste0("There must be at least 2 columns left for mass_spec ",
                      "after removing data for other variables"))
})




# ````````````````` #
#  Missing in args  #
# ................. #


test_that("binMS: NA in arguments", {

  # NA in region specified by ms_inten
  expect_error(binMS(test_NA, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "mass_spec cannot have any missing in the region provided by ms_inten")

  # mtoz with numeric NA
  expect_error(binMS(testMS, numer_NA, "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "mtoz cannot contain any missing")

  # charge with character NA
  expect_error(binMS(testMS, "mtoz", char_NA, "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "charge cannot contain any missing")

  # mass with character NA
  expect_error(binMS(testMS, "mtoz", "chg", char_NA, "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "mass cannot contain any missing")

  # time_peak_reten with character NA
  expect_error(binMS(testMS, "mtoz", "chg", "mass", char_NA, c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "time_peak_reten cannot contain any missing")

  # time_range with numeric NA
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, numer_NA), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "time_range cannot have any missing")

  # mass_range with numeric NA
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, numer_NA), c(2, 10), 0.05, 1),
               "mass_range cannot have any missing")

  # charge_range with numeric NA
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, numer_NA), 0.05, 1),
               "charge_range cannot have any missing")

  # mtoz_diff with numeric NA
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), numer_NA, 1),
               "mtoz_diff cannot have any missing")

  # time_diff with numeric NA
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, numer_NA),
               "time_diff cannot have any missing")
})




# ```````````````````````````````````````````` #
#  Errors in specifying cols in data via name  #
# ............................................ #


test_that("binMS: errors in specifying data in mass_spec by name", {

  # Specify a variable by name for a column name that doesn't exist
  expect_error(binMS(testMS, "asdf", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "column names in mass_spec do not contain asdf element in mtoz")

  # Specify a variable by name when col names for mass_spec are NULL
  expect_error(binMS(test_no_colnames, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "Variable specified by name but data columns not equipped with names")

  # Specify a variable by name for a mass_spec with multiple cols by that name
  expect_error(binMS(test_dup_colnames, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "name provided had multiple matches in data - mtoz element in mtoz")

  # Specify a variable by name with duplicates in the name vector
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms1"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "ms_inten cannot have any duplicate values")

  # Specify a variable by name with ambiguous name (i.e. multiple matches in col names)
  expect_error(binMS(testMS, "m", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "name provided had multiple matches in data - m element in mtoz")
})




# ````````````````````````````````````````````` #
#  Errors in specifying cols in data via index  #
# ............................................. #


test_that("binMS: errors in specifying data in mass_spec by index", {

  # mtoz specify index that is too small
  expect_error(binMS(testMS, 0, "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "out of bounds index 0 provided for mtoz relative to mass_spec")

  # charge specify index that is too big
  expect_error(binMS(testMS, "mtoz", 999, "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "out of bounds index 999 provided for charge relative to mass_spec")

  # mass specify index that is negative
  expect_error(binMS(testMS, "mtoz", "chg", -3, "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "out of bounds index -3 provided for mass relative to mass_spec")

  # ms_inten specify numeric vector with duplicates
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c(5, 5L),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "ms_inten cannot have any duplicate values")
})




# ``````````````````````````````` #
#  Right type but illegal values  #
# ............................... #


test_that("binMS: arguments of the right type but illegal values", {

  # non-numeric in region specified by ms_inten
  expect_error(binMS(testdf, "mtoz", "chg", "mass", "time", c("ms1", "ms2", "extra_dat_3"),
                     c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "mass_spec cannot have any non-numeric in the region provided by ms_inten")

  # time_range with lower bound >= upper bound
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 14L), c(2e3, 15e3), c(2, 10), 0.05, 1),
               "The values of time_range must be in increasing order")

  # mass_range with lower bound >= upper bound
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 0), c(2, 10), 0.05, 1),
               "The values of mass_range must be in increasing order")

  # charge_range with lower bound >= upper bound
  expect_error(binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
                     c(14, 45), c(2e3, 15e3), c(2, 0), 0.05, 1),
               "The values of charge_range must be in increasing order")
})
