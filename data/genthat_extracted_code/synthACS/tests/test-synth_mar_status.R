
library(testthat)
library(synthACS)

context("synth - marital status")

test_that("appropriate inputs", {
  # generate faulty test vectors
  t1 <- rnorm(131)
  t2 <- rnorm(20); names(t2) <- paste0("v", 1:20)
  
  expect_error(synthACS:::synth_data_ag(t1))
  expect_error(synthACS:::synth_data_ag(t2))
})


test_that("creates expected result", {
  # then create multiple examples
  ca <- synthACS:::synth_data_ag(unlist(ca_dat$estimates$age_by_sex[26,]))
  
  ca_ag1 <- synthACS:::synth_data_mar(synthACS:::synth_data_ag(unlist(ca_dat$estimates$age_by_sex[1,])),
                                      unlist(ca_dat$estimates$marital_status[1,]))
  ca_ag2 <- synthACS:::synth_data_mar(ca,unlist(ca_dat$estimates$marital_status[26,]))
  ca_ag3 <- synthACS:::synth_data_mar(synthACS:::synth_data_ag(unlist(ca_dat$estimates$age_by_sex[50,])),
                                      unlist(ca_dat$estimates$marital_status[50,]))
  
  ##---------------------------------------------------------------------------
  ## 02. Tests
  ##---------------------------------------------------------------------------
  # test classes, names, dimensions
  expect_true(is.data.frame(ca_ag1[[1]]))
  expect_true(is.data.frame(ca_ag2[[1]]))
  expect_true(is.data.frame(ca_ag3[[1]]))
  expect_true(is.list(ca_ag1))
  expect_equal(length(ca_ag2), 2)
  expect_equal(ncol(ca_ag1[[1]]), ncol(ca_ag2[[1]]))
  expect_equal(ncol(ca_ag1[[1]]), ncol(ca_ag3[[1]]))
  expect_equal(names(ca_ag1[[1]]), names(ca_ag3[[1]]))
  expect_equal(names(ca_ag1[[1]]), c("age", "gender", "marital_status", "p"))
  
  # correct total probability
  expect_equal(sum(ca_ag1[[1]]$p), 1)
  expect_equal(sum(ca_ag2[[1]]$p), 1)
  expect_equal(sum(ca_ag3[[1]]$p), 1)
  
  # correct probability based on conditioning
  expect_equal(tapply(ca_ag2[[1]]$p, ca_ag2[[1]]$age, sum),
               tapply(ca[[1]]$p, ca[[1]]$age, sum))
  expect_equal(tapply(ca_ag2[[1]]$p, ca_ag2[[1]]$gender, sum),
               tapply(ca[[1]]$p, ca[[1]]$gender, sum))
  
})