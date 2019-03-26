# test_plot.R

context("tacmagic plotting")

test_that("plot.tac runs without error and contains correct axis label", {

  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 
  f_raw_vol <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")
 
  tac <- load_tac(f_raw_tac)
  vol <- load_vol(f_raw_vol)
  AD06_tac_nc <- tac_roi(tac, vol, roi_ham_full(), merge=FALSE, PVC=FALSE)

  pdf(NULL)
  on.exit(dev.off())
  dev.control(displaylist="enable")

  plot(AD06_tac_nc, ROIs=c("frontal", "cerebellum"), time="minutes", 
           title="Example Plot")

  p <- recordPlot()
  
  skip_on_cran()
  expect_equal(unlist(p)[[123]], "Time (minutes)")
  expect_equal(unlist(p)[[37]], 80) # 80 mins last value on x-axis

  pdf(NULL)
  on.exit(dev.off())
  dev.control(displaylist="enable")

  plot(AD06_tac_nc, ROIs=c("frontal", "cerebellum"), time="seconds", 
           title="Example Plot")

  p <- recordPlot()

  expect_equal(unlist(p)[[123]], "Time (seconds)")
})

test_that("plot.tac with 2 tacs and conversion runs without error and 
           contains correct axis label", {

  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 
  f_raw_vol <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")
 
  f_raw_tac2 <- system.file("extdata", "AD07.tac", package="tacmagic") 
  f_raw_vol2 <- system.file("extdata", "AD07_TAC.voistat", package="tacmagic")
 
  tac <- load_tac(f_raw_tac)
  vol <- load_vol(f_raw_vol)
  AD06_tac_nc <- tac_roi(tac, vol, roi_ham_full(), merge=FALSE, PVC=FALSE)
  tac2 <- load_tac(f_raw_tac2)
  vol2 <- load_vol(f_raw_vol2)
  AD07_tac_nc <- tac_roi(tac2, vol2, roi_ham_full(), merge=FALSE, PVC=FALSE)

  pdf(NULL)
  on.exit(dev.off())
  dev.control(displaylist="enable")

  plot(AD06_tac_nc, AD07_tac_nc, ROIs=c("frontal", "cerebellum"), 
           title="Example Plot", time="seconds")

  p <- recordPlot()

  skip_on_cran()
  expect_equal(unlist(p)[[123]], "Time (seconds)")
  expect_equal(unlist(p)[[37]], 4800) #4800 secs on last walk

  ## and errors

  expect_error(plot(AD06_tac_nc, AD07_tac_nc, 
                    ROIs=c("notROI", "cerebellum"), 
                    title="Example Plot", time="seconds"))

  expect_error(plot(AD06_tac_nc, tac, 
                    ROIs=c("frontal", "cerebellum"), 
                    title="Example Plot", time="seconds"))

})

test_that("compare_tac_form() produces errors appropriately", {

  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 
  f_raw_vol <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")
 
  f_raw_tac2 <- system.file("extdata", "AD07.tac", package="tacmagic") 
  f_raw_vol2 <- system.file("extdata", "AD07_TAC.voistat", package="tacmagic")
 
  tac <- load_tac(f_raw_tac)
  vol <- load_vol(f_raw_vol)
  AD06_tac_nc <- tac_roi(tac, vol, roi_ham_full(), merge=FALSE, PVC=FALSE)
  tac2 <- load_tac(f_raw_tac2)
  vol2 <- load_vol(f_raw_vol2)
  AD07_tac_nc <- tac_roi(tac2, vol2, roi_ham_full(), merge=FALSE, PVC=FALSE)

  expect_equal(compare_tac_form(AD06_tac_nc, AD07_tac_nc), TRUE)

  AD06_tac_nc$start[2] <- 16
  expect_error(compare_tac_form(AD06_tac_nc, AD07_tac_nc))

  AD06_tac_nc$start[2] <- 15    #back to normal
  expect_equal(compare_tac_form(AD06_tac_nc, AD07_tac_nc), TRUE)

  AD07_tac_nc$end[2] <- NA
  expect_error(compare_tac_form(AD06_tac_nc, AD07_tac_nc))

  AD07_tac_nc$end[2] <- 30      #back to normal
  expect_equal(compare_tac_form(AD06_tac_nc, AD07_tac_nc), TRUE)

  attributes(AD06_tac_nc)$time_unit <- "minutes"
  expect_error(compare_tac_form(AD06_tac_nc, AD07_tac_nc))

  attributes(AD06_tac_nc)$time_unit <- "seconds"   #back to normal
  expect_equal(compare_tac_form(AD06_tac_nc, AD07_tac_nc), TRUE)

  attributes(AD07_tac_nc)$activity_unit <- "nCi/cc"
  expect_error(compare_tac_form(AD06_tac_nc, AD07_tac_nc))

})
