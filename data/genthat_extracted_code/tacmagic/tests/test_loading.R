# test_loading.R

context("file loading tests")

test_that("load_voistat() accurately loads and weights model data", {

  vs_f <- system.file("extdata", "AD06_BPnd_BPnd_Logan.voistat", 
  	                  package="tacmagic")
  vs <- load_voistat(vs_f, roi_ham_pib(), model="Logan")
  vs_null <- load_voistat(vs_f, model="Logan")

  
  expect_equal(length(vs[,1]), 109)
  expect_equal(typeof(vs$Logan), "double")
  expect_equal(row.names(vs), c(row.names(vs_null), names(roi_ham_pib())))

  # manually calculated values
  expect_equal(vs["Amygdala_r",], 0.3647066959315658)
  expect_equal(vs_null["Amygdala_r",], 0.3647066959315658)
  expect_equal(vs["lefttemporal",], 0.755352081868971)   

})

test_that("validate_tac() properly rejects malformed tac objects", {

  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 
  
  tac <- load_tac(f_raw_tac)
  class(tac) <- "data.frame"
  expect_error(validate_tac(tac))

  tac <- load_tac(f_raw_tac)
  attributes(tac)$time_unit <- "sec"
  expect_message(validate_tac(tac))
  expect_equal(FALSE, validate_tac(tac))

  tac <- load_tac(f_raw_tac)
  attributes(tac)$activity_unit <- "nogood"
  expect_message(validate_tac(tac))
  expect_equal(FALSE, validate_tac(tac))

  tac <- load_tac(f_raw_tac)
  names(tac)[1] <- "mid"
  expect_message(validate_tac(tac))
  expect_equal(FALSE, validate_tac(tac))

  tac <- load_tac(f_raw_tac)
  names(tac)[2] <- "mid"
  expect_message(validate_tac(tac))
  expect_equal(FALSE, validate_tac(tac))
  
})	

test_that("load_tac() gives proper errors and warnings", {

  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 

  expect_warning(load_tac(f_raw_tac, time_unit="minutes"))
  expect_warning(load_tac(f_raw_tac, activity_unit="kBq/cc"))

  expect_error(load_tac(f_raw_tac, format="magia"))
  expect_error(load_tac(f_raw_tac, format="solidgold"))

})

test_that("load_tac() properly loads example DFT file", {

  f <- system.file("extdata", "sample.dft", package="tacmagic")

  tac <- load_tac(f, format="DFT")

  expect_equal(TRUE, validate_tac(tac))

  vars <- c("start","end","putam_dx","putam_sin","cereb_.")

  start <- c(0,0.25,0.5,0.75,1,1.5,2,3,4,5,10)
  end <- c(0.25,0.5,0.75,1,1.5,2,3,4,5,10,15)
  putam_dx <- c(0,1.24,4.68,12.1,18.9,21.2,24.5,23.7,26.8,25.6,26.60)
  putam_sin <- c(-0.00918,1.11,4.71,11.5,19.7,25.6,28.7,26.7,29.2,NA,28)
  cereb_. <- c(0.000298,1.43,5.22,9.87,1.03,9.36,8.69,8.57,6.99,7.05,6.54)
  ans <- data.frame(start, end, putam_dx, putam_sin, cereb_.)
  class(ans) <- c("tac", "data.frame")
  attributes(ans)$time_unit <- "minutes"
  attributes(ans)$activity_unit <- "kBq/cc"

  expect_equal(ans, tac)

})

test_that("load_vol() properly loads example DFT file", {

  f <- system.file("extdata", "sample.dft", package="tacmagic")
  vol <- load_vol(f, format="DFT")

  vars <- c("putam_dx", "putam_sin", "cereb_.")
  actual_vols <- c(675.2, 712.8, 9167.1)
  ans <- data.frame(row.names=vars, volume=actual_vols)

  expect_equal(vol, ans)

})

test_that("load_vol() gives suitable errors", {

  f_raw_vol <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")

  expect_error(load_vol(f_raw_vol, format="titanium"))
})


test_that("load_tac_PMOD() can deal with seconds and minutes", {

  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 
  a <- read.csv(f_raw_tac, sep="\t")
  expect_equal(names(a)[1], "start.seconds.")
  names(a)[1] <- "start.minutes."
  tmp <- tempfile(fileext = ".tac")
  write.table(a, tmp, row.names=FALSE, sep="\t")
  
  fake_minutes <- load_tac(tmp)
  expect_equal(attributes(fake_minutes)$time_unit, "minutes")

  names(a)[1] <- "start.invalid."
  write.table(a, tmp, row.names=FALSE, sep="\t")
  expect_error(load_tac(tmp))

  a <- read.csv(f_raw_tac, sep="\t")
  expect_equal(names(a)[2], "end.kBq.cc.")
  names(a)[2] <- "end.invalid."
  write.table(a, tmp, row.names=FALSE, sep="\t")
  expect_error(load_tac(tmp))

})
