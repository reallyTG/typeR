# test_save.R

context("tac saving")

test_that("save_tac() gives error if outfile is bad format", {

  skip_on_cran() # CRAN tests should only try to save to tmp dirs
  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 
  tac <- load_tac(f_raw_tac)
  expect_error(save_tac(tac, c("hi", "bye")))
  expect_error(save_tac(tac, 1))

})

test_that("save_tac() reproduces the original PMOD .tac file", {

  tmp <- tempfile(fileext = ".tac")
  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 
  tac <- load_tac(f_raw_tac)

  save_tac(tac, tmp)
  new <- load_tac(tmp)

  expect_equal(tac, new) 

})


test_that("save_tac() saves a merged tac object without error", {

  tmp <- tempfile(fileext=".tac")
  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 
  f_raw_vol <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")
  tac <- load_tac(f_raw_tac)
  vol <- load_vol(f_raw_vol)
  AD06_tac_nc <- tac_roi(tac, vol, roi_ham_full(), merge=TRUE, PVC=FALSE)

  tmp <- tempfile(fileext=".tac")
  save_tac(AD06_tac_nc, tmp)
  new <- load_tac(tmp)

  expect_equal(new, AD06_tac_nc)
  expect_identical(TRUE, validate_tac(new))

 })


test_that("save_tac() saves a magia tac object without error", {

  tmp <- tempfile(fileext=".tac")
  f_magia <- system.file("extdata", "AD06_tac_magia.mat", package="tacmagic")
  n <- load_tac(f_magia, format="magia", time_unit="seconds", 
  	            activity_unit="kBq/cc")

  save_tac(n, tmp)
  new <- load_tac(tmp)

  expect_identical(TRUE, validate_tac(new))
  expect_equal(n, new)

 })
