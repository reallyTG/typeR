
library(testthat)
library(synthACS)

context("synth - edu")
##---------------------------------------------------------------------------
## 01. build out test datasets
##---------------------------------------------------------------------------
# load
# load("./synthACS/tests/testthat/acsdat.Rdata")

test_that("get correct results", {
  # then create multiple examples
  ca <- synthACS:::synth_data_mar(synthACS:::synth_data_ag(unlist(ca_dat$estimates$age_by_sex[26,])),
    unlist(ca_dat$estimates$marital_status[26,]))
  
  ca_ag1 <- synthACS:::synth_data_edu(synthACS:::synth_data_mar(
    synthACS:::synth_data_ag(unlist(ca_dat$estimates$age_by_sex[1,])),
      unlist(ca_dat$estimates$marital_status[1,])),
    unlist(ca_dat$estimates$edu[1,]))
  ca_ag2 <- synthACS:::synth_data_edu(ca, unlist(ca_dat$estimates$edu[26,]))
  ca_ag3 <- synthACS:::synth_data_edu(synthACS:::synth_data_mar(
    synthACS:::synth_data_ag(unlist(ca_dat$estimates$age_by_sex[50,])),
      unlist(ca_dat$estimates$marital_status[50,])),
    unlist(ca_dat$estimates$edu[50,]))
  
  ##---------------------------------------------------------------------------
  ## 02. Tests
  ##---------------------------------------------------------------------------
  # test classes, names, dimensions
  expect_true(is.data.frame(ca_ag1[[1]]))
  expect_true(is.data.frame(ca_ag2[[1]]))
  expect_true(is.data.frame(ca_ag3[[1]]))
  expect_true(is.list(ca_ag1))
  expect_equal(length(ca_ag2), 2)
  expect_equal(levels(ca_ag1[[1]]$age), ca_ag2[[2]])
  
  expect_equal(ncol(ca_ag1[[1]]), ncol(ca_ag2[[1]]))
  expect_equal(ncol(ca_ag1[[1]]), ncol(ca_ag3[[1]]))
  expect_equal(names(ca_ag1[[1]]), names(ca_ag3[[1]]))
  expect_equal(names(ca_ag1[[1]]), c("age", "gender", "marital_status", "edu_attain", "p"))
  
  # test total probability
  expect_equal(sum(ca_ag1[[1]]$p), 1)
  expect_equal(sum(ca_ag2[[1]]$p), 1)
  expect_equal(sum(ca_ag3[[1]]$p), 1)
  
  # correct probability based on conditioning
  expect_equal(tapply(ca_ag2[[1]]$p, ca_ag2[[1]]$age, sum),
               tapply(ca[[1]]$p, ca[[1]]$age, sum))
  expect_equal(tapply(ca_ag2[[1]]$p, ca_ag2[[1]]$gender, sum),
               tapply(ca[[1]]$p, ca[[1]]$gender, sum))
  
})