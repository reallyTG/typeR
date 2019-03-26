# test_cutoff.R

  # Fake data was made for this by the following:

  # higher <- matrix(rnorm(40, 1.9, 0.6), ncol=4, nrow=10)
  # lower <- matrix(rnorm(160, 1.3, 0.3), ncol=4, nrow=40)
  # fake_data <- as.data.frame(rbind(higher, lower))
  # row.names(fake_data) <- paste0("p", 1:50)
  # colnames(fake_data) <- c("ROI1_DVR", "ROI2_DVR", "ROI3_DVR", "ROI4_DVR")
  # save(fake_data, "fake_DVR.Rda")

context("Cutoff score calculation")

test_that("upper_inner_fence calculates UIF as with sample data", {

  d <- c(1,2,3,4,5,6,7,8,9) 
  # IQR = 7-3 = 4
  # UIF = (4*1.5) + 7 = 13
  expect_equal(13, upper_inner_fence(d))    

})

test_that("fake data for cutoff testing is as expected", {
  
  expect_equal(mean(unlist(fake_DVR)), 1.310381, tol=0.00001)

})


test_that("cutoff_aiz() produces accurate error and messages", {

  # Need to specify > 1 ROI
  expect_error(cutoff_aiz(fake_DVR, c("ROI1_DVR")))

  expect_message(cutoff_aiz(fake_DVR, c("ROI1_DVR", "ROI2_DVR", "ROI3_DVR")), 
                 "Iteration: 1 Removed: 10")
  expect_message(cutoff_aiz(fake_DVR, c("ROI1_DVR", "ROI2_DVR", "ROI3_DVR")), 
                 "Iteration: 2 Removed: 0")
  expect_message(cutoff_aiz(fake_DVR, c("ROI1_DVR", "ROI2_DVR", "ROI3_DVR", 
                                        "ROI4_DVR")),
                 "Iteration: 3 Removed: 0")

})


test_that("cutoff_aiz() calculates ROI-based cutoffs accurately", {
  
  #> upper_inner_fence(fake_DVR[,"ROI1_DVR"])
  # [1] 1.489996
  #> fake_DVR[1:50,"ROI1_DVR"] > 1.489996
  #[1]  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE
  #[13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[25] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[37] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[49] FALSE FALSE

  # round1_ROI1 <- c(1,2,5,6,8,9,10)

  #> upper_inner_fence(fake_DVR[,"ROI2_DVR"])
  #[1] 1.524423
  #> fake_DVR[1:50,"ROI2_DVR"] > 1.524423
  #[1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
  #[13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[25] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[37] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[49] FALSE FALSE

  # round1_ROI2 <- c(1,2,3,4,5,6,7,8,9,10)

  #> upper_inner_fence(fake_DVR[,"ROI3_DVR"])
  #[1] 1.468633
  #> fake_DVR[1:50,"ROI3_DVR"] > 1.468633
  #[1] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
  #[13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[25] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[37] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[49] FALSE FALSE 

  # round1_ROI3 <- c(5,6,7,8,9,10)

  #> upper_inner_fence(fake_DVR[,"ROI4_DVR"])
  #[1] 1.391579
  #> fake_DVR[1:50,"ROI4_DVR"] > 1.391579
  #[1]  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE
  #[13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[25] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[37] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[49] FALSE FALSE

  # round1_ROI4 <- c(1,2,3,4,7,9,10)

  #> upper_inner_fence(fake_DVR[11:50,"ROI1_DVR"])
  #[1] 1.348192
  #> any(fake_DVR[11:50,"ROI1_DVR"] > 1.348192)
  #[1] FALSE
  # > upper_inner_fence(fake_DVR[11:50,"ROI2_DVR"])
  # [1] 1.322261
  # > any(fake_DVR[11:50,"ROI2_DVR"] > 1.322261)
  # [1] FALSE
  # > upper_inner_fence(fake_DVR[11:50,"ROI3_DVR"])
  # [1] 1.326302
  # > any(fake_DVR[11:50,"ROI3_DVR"] > 1.326302)
  # [1] FALSE
  #> upper_inner_fence(fake_DVR[11:50,"ROI4_DVR"])
  #[1] 1.278981
  # > any(fake_DVR[11:50,"ROI4_DVR"] > 1.278981)
  # [1] TRUE
  # > fake_DVR[11:50,"ROI4_DVR"] > 1.278981
  # > fake_DVR[11:50,"ROI4_DVR"] > 1.278981
  #[1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
  #[25] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #[37] FALSE FALSE FALSE FALSE

  clean <- c(11:33, 35:50)

  expect_equal(cutoff_aiz(fake_DVR, c("ROI1_DVR", "ROI2_DVR", "ROI3_DVR", 
                                      "ROI4_DVR"))[[1]], 
  	           upper_inner_fence(fake_DVR[clean,]$ROI1_DVR))

  expect_equal(cutoff_aiz(fake_DVR, c("ROI1_DVR", "ROI2_DVR", "ROI3_DVR", 
                                      "ROI4_DVR"))[[2]], 
  	           upper_inner_fence(fake_DVR[clean,]$ROI2_DVR))

  #> upper_inner_fence(fake_DVR[clean,]$ROI3_DVR)
  #[1] 1.3330504

  expect_equal(cutoff_aiz(fake_DVR, c("ROI1_DVR", "ROI2_DVR", "ROI3_DVR", 
                                      "ROI4_DVR"))[[3]], 
  	           1.330504, tol=0.00001)

  #> upper_inner_fence(fake_DVR[clean,]$ROI4_DVR)
  #[1] 1.27347
  expect_equal(cutoff_aiz(fake_DVR, c("ROI1_DVR", "ROI2_DVR", "ROI3_DVR", 
                                      "ROI4_DVR"))[[4]], 
  	           1.27347, tol=0.00001)  

})

test_that("pos_anyroi() dichotomizes participants accurately", {

  cutoffs <- cutoff_aiz(fake_DVR, c("ROI1_DVR", "ROI2_DVR", "ROI3_DVR", 
                                    "ROI4_DVR"))
  pos_table <- pos_anyroi(fake_DVR, cutoffs)

  expect_type(pos_table, "logical")
  expect_equal(sum(pos_table), 11)
  expect_equal(sum(pos_table[c(1:10, 34)]), 11)
  expect_equal(sum(pos_table[!c(1:10, 34)]), 0)

})

