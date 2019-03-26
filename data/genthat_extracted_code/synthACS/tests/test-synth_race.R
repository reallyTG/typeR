
library(testthat)
library(synthACS)

context("synth - race")

test_that("get correct results", {
  # then create multiple examples
  ca <- synthACS:::synth_data_inc(
    synthACS:::synth_data_geomob(synthACS:::synth_data_pov(synthACS:::synth_data_nativ(
      synthACS:::synth_data_emp(synthACS:::synth_data_edu(synthACS:::synth_data_mar(
        synthACS:::synth_data_ag(
          unlist(ca_dat$estimates$age_by_sex[26,])),
        unlist(ca_dat$estimates$marital_status[26,])),
        unlist(ca_dat$estimates$edu[26,])),
        unlist(ca_dat$estimates$emp_status[26,])),
      unlist(ca_dat$estimates$nativity[26,])),
      pov_ge_vec= unlist(ca_dat$estimates$pov_status1[26,]), total_pop= ca_dat$estimates$age_by_sex[26,1]),
      unlist(ca_dat$estimates$geo_mob_edu[26,])),
    unlist(ca_dat$estimates$by_inc_12mo[26,]))
  
  ca_ag1 <- synthACS:::synth_data_race(synthACS:::synth_data_inc(
    synthACS:::synth_data_geomob(synthACS:::synth_data_pov(synthACS:::synth_data_nativ(
      synthACS:::synth_data_emp(synthACS:::synth_data_edu(synthACS:::synth_data_mar(
        synthACS:::synth_data_ag(unlist(ca_dat$estimates$age_by_sex[1,])),
        unlist(ca_dat$estimates$marital_status[1,])),
        unlist(ca_dat$estimates$edu[1,])),
        unlist(ca_dat$estimates$emp_status[1,])),
      unlist(ca_dat$estimates$nativity[1,])),
      pov_ge_vec= unlist(ca_dat$estimates$pov_status1[1,]), total_pop= ca_dat$estimates$age_by_sex[1,1]),
      unlist(ca_dat$estimates$geo_mob_edu[1,])),
    unlist(ca_dat$estimates$by_inc_12mo[1,])),
    unlist(ca_dat$estimates$pop_by_race[1,]))
  
  ca_ag2 <- synthACS:::synth_data_race(ca, unlist(ca_dat$estimates$pop_by_race[26,]))
  
  ca_ag3 <- synthACS:::synth_data_race(synthACS:::synth_data_inc(
    synthACS:::synth_data_geomob(synthACS:::synth_data_pov(synthACS:::synth_data_nativ(
      synthACS:::synth_data_emp(synthACS:::synth_data_edu(synthACS:::synth_data_mar(
        synthACS:::synth_data_ag(unlist(ca_dat$estimates$age_by_sex[50,])),
        unlist(ca_dat$estimates$marital_status[50,])),
        unlist(ca_dat$estimates$edu[50,])),
        unlist(ca_dat$estimates$emp_status[50,])),
      unlist(ca_dat$estimates$nativity[50,])),
      pov_ge_vec= unlist(ca_dat$estimates$pov_status1[50,]), total_pop= ca_dat$estimates$age_by_sex[50,1]),
      unlist(ca_dat$estimates$geo_mob_edu[50,])),
    unlist(ca_dat$estimates$by_inc_12mo[50,])),
    unlist(ca_dat$estimates$pop_by_race[50,]))
  ##---------------------------------------------------------------------------
  ## 02. Tests
  ##---------------------------------------------------------------------------
  # test classes, names, dimensions
  expect_true(is.data.frame(ca_ag1))
  expect_true(is.data.frame(ca_ag2))
  expect_true(is.data.frame(ca_ag3))
  
  expect_equal(ncol(ca_ag1), ncol(ca_ag2))
  expect_equal(ncol(ca_ag1), ncol(ca_ag3))
  expect_equal(names(ca_ag1), names(ca_ag3))
  expect_equal(names(ca_ag1), 
               c("age", "gender", "marital_status", "edu_attain", "emp_status", "nativity", 
                 "pov_status", "geog_mobility", "ind_income", "race", "p"))
  
  # test total probability
  expect_equal(sum(ca_ag1$p), 1)
  expect_equal(sum(ca_ag2$p), 1)
  expect_equal(sum(ca_ag3$p), 1)
  
  # correct probability based on conditioning
  expect_equal(tapply(ca_ag2$p, ca_ag2$gender, sum),
               tapply(ca[[1]]$p, ca[[1]]$gender, sum))
  
})