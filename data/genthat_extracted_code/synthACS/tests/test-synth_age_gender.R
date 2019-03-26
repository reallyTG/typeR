
library(testthat)
library(synthACS)

context("synth - age & gender")

test_that("accurately named vector", {
  # generate faulty test vectors
  t1 <- rnorm(50)
  t2 <- rnorm(20); names(t2) <- paste0("v", 1:20)
  
  act_names <- c('pop_age_cnt_all', 'male_pop', 'female_pop', 'm_u15', 'm_15_17', 'm_18_24', 'm_25_29', 
    'm_30_34', 'm_35_39', 'm_40_44', 'm_45_49', 'm_50_54', 'm_55_59', 'm_60_64', 'm_65_69', 
    'm_70_74', 'm_75_79', 'm_80_84', 'm_85up', 'f_u15', 'f_15_17', 'f_18_24', 'f_25_29', 'f_30_34', 
    'f_35_39', 'f_40_44', 'f_45_49', 'f_50_54', 'f_55_59', 'f_60_64', 'f_65_69', 'f_70_74', 'f_75_79', 
    'f_80_84', 'f_85up')
  
  t3 <- rnorm(length(act_names)); names(t3) <- act_names
  
  expect_error(synthACS:::synth_data_ag(t1))
  expect_error(synthACS:::synth_data_ag(t2))
  expect_error(synthACS:::synth_data_ag(t3))
})


test_that("creates expected result", {
  # then create multiple examples
  ca_ag1 <- synthACS:::synth_data_ag(unlist(ca_dat$estimates$age_by_sex[1,]))
  ca_ag2 <- synthACS:::synth_data_ag(unlist(ca_dat$estimates$age_by_sex[20,]))
  ca_ag3 <- synthACS:::synth_data_ag(unlist(ca_dat$estimates$age_by_sex[50,]))
  
  ##---------------------------------------------------------------------------
  ## 02. Tests
  ##---------------------------------------------------------------------------
  # test output
  expect_true(is.data.frame(ca_ag1[[1]]))
  expect_true(is.data.frame(ca_ag2[[1]]))
  expect_true(is.data.frame(ca_ag3[[1]]))
  expect_true(is.list(ca_ag1))
  expect_equal(length(ca_ag2), 1)
  
  expect_equal(ncol(ca_ag1[[1]]), ncol(ca_ag2[[1]]))
  expect_equal(ncol(ca_ag1[[1]]), ncol(ca_ag3[[1]]))
  expect_equal(names(ca_ag1[[1]]), names(ca_ag3[[1]]))
  expect_equal(names(ca_ag1[[1]]), c("age", "gender", "p"))
  expect_equal(sum(ca_ag1[[1]]$p), 1)
  expect_equal(sum(ca_ag2[[1]]$p), 1)
  expect_equal(sum(ca_ag3[[1]]$p), 1)
  
})