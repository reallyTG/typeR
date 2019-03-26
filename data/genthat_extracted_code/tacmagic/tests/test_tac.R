# test_tac.R

context("TAC data loading and weighted averages")

test_that("tac_roi() accurately calculates weighted averages from PMOD .tac and 
	      .voistat files", {
  
  f_ans_nc <- system.file("extdata", "AD06_man_fullROI.csv", 
                          package="tacmagic")
  f_ans_pvc <- system.file("extdata", "AD06_man_fullROI_c.csv", 
  	                       package="tacmagic")
  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic")
  f_raw_vol <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")

  ans_nc <- read.csv(f_ans_nc)
  attributes(ans_nc)$time_unit <- "seconds"
  attributes(ans_nc)$activity_unit <- "kBq/cc"
  class(ans_nc) <- c("tac", "data.frame")
  ans_pvc <- read.csv(f_ans_pvc)
  attributes(ans_pvc)$time_unit <- "seconds"
  attributes(ans_pvc)$activity_unit <- "kBq/cc"
  class(ans_pvc) <- c("tac", "data.frame")

  tac <- load_tac(f_raw_tac)
  vol <- load_vol(f_raw_vol)

  AD06_tac_nc <- tac_roi(tac, vol, roi_ham_full(), merge=F, PVC=F)
  AD06_tac_pvc <- tac_roi(tac, vol, roi_ham_full(), merge=F, PVC=T)
  AD06_merge <- tac_roi(tac, vol, roi_ham_full(), merge=T, PVC=F)

  expect_equal(AD06_tac_nc, ans_nc)
  expect_equal(AD06_tac_pvc, ans_pvc)
  expect_equal(validate_tac(AD06_tac_nc), TRUE)
  expect_equal(validate_tac(AD06_tac_pvc), TRUE)
  expect_equal(length(names(AD06_merge)), 196)

})

test_that("tac_roi() accurately calculates weighted averages from PMOD .voistat 
	      and .acqtimes files", {
  
  f_ans_nc <- system.file("extdata", "AD06_man_fullROI.csv", 
                          package="tacmagic")
  f_ans_pvc <- system.file("extdata", "AD06_man_fullROI_c.csv", 
  	                       package="tacmagic")
  f_acq <- system.file("extdata", "AD06.acqtimes", package="tacmagic")
  f_voistat <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")

  tac <- load_tac(f_voistat, format="voistat", acqtimes=f_acq)
  vol <- load_vol(f_voistat)

  AD06_tac_nc_vs <- tac_roi(tac, vol, roi_ham_full(), merge=F, PVC=F)
  AD06_tac_pvc_vs <- tac_roi(tac, vol, roi_ham_full(), merge=F, PVC=T)

  ans_nc <- read.csv(f_ans_nc)
  attributes(ans_nc)$time_unit <- "seconds"
  attributes(ans_nc)$activity_unit <- "kBq/cc"
  class(ans_nc) <- c("tac", "data.frame")
  ans_pvc <- read.csv(f_ans_pvc)
  attributes(ans_pvc)$time_unit <- "seconds"
  attributes(ans_pvc)$activity_unit <- "kBq/cc"
  class(ans_pvc) <- c("tac", "data.frame")

  expect_equal(AD06_tac_nc_vs, ans_nc)
  expect_equal(AD06_tac_pvc_vs, ans_pvc)
  expect_equal(validate_tac(AD06_tac_nc_vs), TRUE)
  expect_equal(validate_tac(AD06_tac_pvc_vs), TRUE)

})

test_that("tac_roi() rejects a bad tac", {

  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 
  f_voistat <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")

  tac_good <- load_tac(f_raw_tac)
  tac_bad <- tac_good
  class(tac_bad) <- "data.frame"  # not a tac class object

  vol <- load_vol(f_voistat)

  expect_error(tac_roi(tac_bad, vol, roi_ham_full(), merge=F, PVC=F))

  expect_error(plot_tac(tac_good, tac_bad, ROI=c("Amygdala_l", "Hippocampus_l"),
                        title="Example Plot"))

  expect_error(plot_tac(tac_bad, tac_good, ROI=c("Amygdala_l", "Hippocampus_l"),
                        title="Example Plot"))

})

test_that("tac_roi() can load magia matlab files to the proper format", {

  f_magia <- system.file("extdata", "AD06_tac_magia.mat", package="tacmagic")
  m <- load_tac_magia(f_magia)
  attributes(m)$time_unit <- "seconds"
  attributes(m)$activity_unit <- "kBq/cc"
  class(m) <- c("tac", "data.frame")
  n <- load_tac(f_magia, format="magia", time_unit="seconds", 
  	            activity_unit="kBq/cc")
  expect_is(m, "data.frame")
  expect_equal(names(m)[1:2], c("start", "end"))
  expect_identical(m, n)
  expect_equal(validate_tac(n), TRUE)

})	

test_that("load_tac_voistat produces errors appropriately", {

  f_acq_bad <- system.file("extdata", "AD06_invalid.acqtimes", 
                           package="tacmagic")
  f_voistat <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")

  expect_error(load_tac(f_voistat, format="voistat", acqtimes=f_acq_bad))

})

test_that("summary.tac provides correct output for valid/invalid tac objects", {

  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 
  f_raw_vol <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")
  tac <- load_tac(f_raw_tac)
  vol <- load_vol(f_raw_vol)
  AD06_tac_nc <- tac_roi(tac, vol, roi_ham_full(), merge=FALSE, PVC=FALSE)

  expected_output <- paste0("tac object\n",
                " Activity unit:           kBq/cc \n",
                " Time unit:               seconds \n",
                " Number of ROIs:          22 \n",
                " Number of frames:        34 \n",
                " Time span:               0 - 5400 seconds \n",
                " Unique frame durations:  15 30 60 180 300 600 seconds ")

  expect_equal(capture_output(summary(AD06_tac_nc)), expected_output)

  names(AD06_tac_nc)[1] <- "stttttart"
  expect_error(summary(AD06_tac_nc))
})

test_that("split_pvc produces expected tac objects", {

  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 
  tac <- load_tac(f_raw_tac)

  expect_equal(names(tac)[1:88], names(split_pvc(tac, PVC=FALSE)))
  expect_equal(names(tac)[c(1, 2, 89:174)], names(split_pvc(tac, PVC=TRUE)))

})

test_that("as.tac creates valid tac objects and fails appropriately", {

  manual <- data.frame(start=c(0:4), end=c(2:6), 
                       ROI1=c(10.1:14.2), ROI2=c(11:15))
  manual_tac <- as.tac(manual, time_unit="minutes", activity_unit="kBq/cc")

  expect_equal(validate_tac(manual_tac), TRUE)

  expect_equal(validate_tac(as.tac(manual, time_unit="seconds", 
                                          activity_unit="Bq/cc")), TRUE)

  expect_equal(validate_tac(as.tac(manual, time_unit="wrong", 
                                          activity_unit="Bq/cc")), FALSE)

  expect_equal(validate_tac(as.tac(manual, time_unit="seconds", 
                                          activity_unit="wrong")), FALSE)
  
  expect_error(as.tac(manual, activity_unit="kBq/cc"))
  expect_error(as.tac(manual, time_unit="seconds"))
  expect_error(as.tac(manual))

})
