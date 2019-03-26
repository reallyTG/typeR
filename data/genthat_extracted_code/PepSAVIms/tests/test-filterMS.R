
# ``````````````````` #
#  Load testing data  #
# ................... #

# See construct-data/cd-summary-filterMS.R for the file used to create the data
load(file.path("..", "data", "data-filterMS.RData"))




# `````````````````````````````````````````````````` #
#  Valid input with various argument specifications  #
# .................................................. #

context("filterMS method")

test_that("filterMS: test with valid input", {

  # region specify by name, border specify "all"
  out <- filterMS(msDatObj, paste0("frac", 3:4), "all", 0.05, 1000, 7L)
  expect_identical(out, true_filterMS)

  # region specify by name, border specify "none"
  out <- filterMS(msDatObj, paste0("frac", 3:4), "none", 0.05, 1000, 7L)
  expect_identical(out, true_zero_border)

  # region speciy by indices
  out <- filterMS(msDatObj, 3:4, "all", 0.05, 1000, 7L)
  expect_identical(out, true_filterMS)

  # border size 1L
  out <- filterMS(msDatObj, paste0("frac", 3:4), 1L, 0.05, 1000, 7L)
  expect_identical(out, true_one_border)

  # border size c(0L, 1L)
  out <- filterMS(msDatObj, paste0("frac", 3:4), 1:0, 0.05, 1000, 7L)
  expect_identical(out, true_onezero_border)

  # border size 2 (encompasses all non-region cols)
  out <- filterMS(msDatObj, paste0("frac", 3:4), 2L, 0.05, 1000, 7L)
  expect_identical(out, true_border_num_all)

  # msObj specify a binMS object
  out <- filterMS(binMS_obj, paste0("frac", 3:4), "all", 0.05, 1000, 7L)
  expect_identical(out, true_filterMS)

  # No observations satisfy criteria (maximum charge set to 0)
  expect_warning(out <- filterMS(msDatObj, paste0("frac", 3:4), "all", 0.05, 1000, 0L),
                 "There are no compounds that met all of the criteria")
  expect_identical(out, true_nosatisfy)
})




# ```````````````````````````````````` #
#  Test region and borders assignment  #
# .................................... #

# Tests in this section are done by checking that the region of border names
# supplied to the summ_info object are as they should be

test_that("filterMS: region and border assignment", {

  # region: specify with char
  out <- filterMS(msDatObj_alt, paste0("ms", 5:6))
  expect_identical( out$summ_info$reg_nm, paste0("ms", 5:6) )

  # region: specify with indices
  out <- filterMS(msDatObj_alt, 5:6)
  expect_identical( out$summ_info$reg_nm, paste0("ms", 5:6) )

  # border: specify "all"
  out <- filterMS(msDatObj_alt, 5:6, "all")
  expect_identical( out$summ_info$bor_nm, paste0("ms", c(1:4, 7:12)) )

  # border: specify "none"
  out <- filterMS(msDatObj_alt, 5:6, "none")
  expect_identical( out$summ_info$bor_nm, character(0) )

  # border: specify 3
  out <- filterMS(msDatObj_alt, 5:6, 3)
  expect_identical( out$summ_info$bor_nm, paste0("ms", c(2:4, 7:9)) )

  # border: specify 3, 44
  out <- filterMS(msDatObj_alt, 5:6, c(3, 43))
  expect_identical( out$summ_info$bor_nm, paste0("ms", c(2:4, 7:12)) )

  # border: specify 0
  out <- filterMS(msDatObj_alt, 5:6, 0)
  expect_identical( out$summ_info$bor_nm, character(0) )
})




# ``````````````````````````` #
#  Missing param for formals  #
# ........................... #

test_that("filterMS: missing input", {

  # Note that the remaining formal args have defaults

  # msObj missing
  expect_error( filterMS( , region=region), "Must provide an argument for msObj" )

  # region missing
  expect_error( filterMS(msDatObj), "Must provide an argument for region" )
})





# ```````````````````````````````` #
#  Argument is nonexistent object  #
# ................................ #

test_that("filterMS: nonexistent object", {

  # msObj arg a nonexistent object
  expect_error(filterMS(asdf, 3:4, "all", 0.05, 1000, 7L),
               "object 'asdf' not found for msObj")

  # region arg a nonexistent object
  expect_error(filterMS(msDatObj, asdf, "all", 0.05, 1000, 7L),
               "object 'asdf' not found for region")

  # border arg a nonexistent object
  expect_error(filterMS(msDatObj, 3:4, asdf, 0.05, 1000, 7L),
               "object 'asdf' not found for border")

  # bord_ratio arg a nonexistent object
  expect_error(filterMS(msDatObj, 3:4, "all", asdf, 1000, 7L),
               "object 'asdf' not found for bord_ratio")

  # min_inten arg a nonexistent object
  expect_error(filterMS(msDatObj, 3:4, "all", 0.05, asdf, 7L),
               "object 'asdf' not found for min_inten")

  # max_chg arg a nonexistent object
  expect_error(filterMS(msDatObj, 3:4, "all", 0.05, 1000, asdf),
               "object 'asdf' not found for max_chg")
})




# ``````````````````````` #
#  Argument contains NAs  #
# ....................... #

test_that("filterMS: NAs in argument", {

  # Note: we assume that the msDat object is valid

  # region has NA
  expect_error(filterMS(msDatObj, c(2, NA), "all", 0.05, 1000, 7L),
               "region cannot contain any missing")

  # border has NA (character)
  expect_error(filterMS(msDatObj, 3:4, NA_character_, 0.05, 1000, 7L),
               "If border is of type character, then it must have value \"all\" or \"none\"")

  # border has NA (numeric)
  expect_error(filterMS(msDatObj, 3:4, c(1L, NA_integer_), 0.05, 1000, 7L),
               "border cannot contain any missing")

  # bord_ratio has NA
  expect_error(filterMS(msDatObj, 3:4, "all", NA_real_, 1000, 7L),
               "bord_ratio cannot contain any missing")

  # min_inten has NA
  expect_error(filterMS(msDatObj, 3:4, "all", 0.05, NA_real_, 7L),
               "min_inten cannot contain any missing")

  # max_chg has NA
  expect_error(filterMS(msDatObj, 3:4, "all", 0.05, 1000, NA_integer_),
               "max_chg cannot contain any missing")
})




# `````````````````````````````````` #
#  msObj invalid arguments provided  #
# .................................. #

# note that we assume msDat objects to be valid

test_that("filterMS: invalid msObj", {
  expect_error( filterMS(22, 3:4), "msObj must be of class \"msDat\"" )
})




# ``````````````````````````````````` #
#  region invalid arguments provided  #
# ................................... #

test_that("filterMS: invalid region", {

  # invalid type
  expect_error( filterMS(msDatObj, list()),
                "region must be either of mode character or numeric" )

  # 0 length vec (numeric)
  expect_error( filterMS(msDatObj, integer(0)),
                "region must have length > 0" )

  # 0 length vec (character)
  expect_error( filterMS(msDatObj, character(0)),
                "region must have length > 0" )

  # duplicate values specifying region (numeric)
  expect_error( filterMS(msDatObj, c(1, 1)),
                "region cannot have any duplicate values" )

  # duplicate values specifying region (character)
  expect_error( filterMS(msDatObj, c("frac1", "frac1")),
                "region cannot have any duplicate values" )

  # out of bounds index provided (too small)
  expect_error( filterMS(msDatObj, 0),
                "out of bounds index 0 provided for region relative to ms" )

  # out of bounds index provided (too big)
  expect_error( filterMS(msDatObj, 300),
                "out of bounds index 300 provided for region relative to ms" )

  # name provided that isn't in the column names
  expect_error( filterMS(msDatObj, c("frac1", "frac_not_in_ms")),
                "column names in ms do not contain frac_not_in_ms element in region" )

  # name provided that has multiple matches in the column names
  expect_error( filterMS(msDatObj, "frac"),
                "name provided had multiple matches in data - frac element in region" )
})




# ``````````````````````````````````` #
#  border invalid arguments provided  #
# ................................... #

test_that("filterMS: invalid border", {

  # invalid type
  expect_error( filterMS(msDatObj, 3:4, list()),
                "border must be an atomic vector with either mode character or mode numeric" )

  # character value illegal value (can either be "all" or "none" or numeric)
  expect_error( filterMS(msDatObj, 3:4, "some"),
                "If border is of type character, then it must have value \"all\" or \"none\"" )

  # character vector length > 1 (can either be "all" or "none" or numeric)
  expect_error( filterMS(msDatObj, 3:4, c("all", "none")),
                "If border is of type character, then it must have value \"all\" or \"none\"" )

  # numeric vector length 0
  expect_error( filterMS(msDatObj, 3:4, integer(0)),
                "border must have length 1 or 2" )

  # numeric vector length > 2
  expect_error( filterMS(msDatObj, 3:4, 1:3),
                "border must have length 1 or 2" )

  # numeric value < 0 (length 1 vector)
  expect_error( filterMS(msDatObj, 3:4, -3),
                "The value of border must be greater than or equal to 0" )

  # numeric value < 0 (length 2 vector)
  expect_error( filterMS(msDatObj, 3:4, c(3, -9)),
                "The value of border must be greater than or equal to 0" )
})




# ``````````````````````````````````````` #
#  bord_ratio invalid arguments provided  #
# ....................................... #

test_that("filterMS: invalid bord_ratio", {

  # wrong type
  expect_error( filterMS(msDatObj, 3:4, bord_ratio=list()), "bord_ratio must be of mode numeric" )

  # vector of wrong mode
  expect_error( filterMS(msDatObj, 3:4, bord_ratio="none"), "bord_ratio must be of mode numeric" )

  # value < 0
  expect_error( filterMS(msDatObj, 3:4, bord_ratio=-1), "bord_ratio must be nonnegative" )

  # vector length 0
  expect_error( filterMS(msDatObj, 3:4, bord_ratio=numeric(0)), "bord_ratio must be of length 1" )

  # vector length 2
  expect_error( filterMS(msDatObj, 3:4, bord_ratio=numeric(0)), "bord_ratio must be of length 1" )
})




# `````````````````````````````````````` #
#  min_inten invalid arguments provided  #
# ...................................... #

test_that("filterMS: invalid min_inten", {

  # wrong type
  expect_error( filterMS(msDatObj, 3:4, min_inten=list()), "min_inten must be of mode numeric" )

  # vector of wrong mode
  expect_error( filterMS(msDatObj, 3:4, min_inten="no_inten"), "min_inten must be of mode numeric" )

  # vector length 0
  expect_error( filterMS(msDatObj, 3:4, min_inten=numeric(0)), "min_inten must be of length 1" )

  # vector length 2
  expect_error( filterMS(msDatObj, 3:4, min_inten=1:2), "min_inten must be of length 1" )
})




# ```````````````````````````````````` #
#  max_chg invalid arguments provided  #
# .................................... #

test_that("filterMS: max_chg", {

  # wrong type
  expect_error( filterMS(msDatObj, 3:4, max_chg=list()), "max_chg must be of mode numeric" )

  # vector of wrong mode
  expect_error( filterMS(msDatObj, 3:4, max_chg="no_inten"), "max_chg must be of mode numeric" )

  # vector length 0
  expect_error( filterMS(msDatObj, 3:4, max_chg=integer(0)), "max_chg must be of length 1" )

  # vector length 2
  expect_error( filterMS(msDatObj, 3:4, max_chg=1:2), "max_chg must be of length 1" )
})
