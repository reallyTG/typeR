context("MPTinR basic tests")

test_that("No-pooling approaches work", {
  
  ##testthat::skip_on_cran()
  
  EQN_FILE <- system.file("extdata", "prospective_memory.eqn", package = "MPTmultiverse")
  DATA_FILE <- system.file("extdata", "smith_et_al_2011.csv", package = "MPTmultiverse")
  
  data <- read.csv(DATA_FILE, fileEncoding = "UTF-8-BOM")
  data <- data[c(1:5, 113:118),]
  COL_CONDITION <- "WM_EX"
  data[[COL_CONDITION]] <- factor(
    data[[COL_CONDITION]]
    , levels = 1:2
    , labels = c("low_WM", "high_WM")
  )
  op <- mpt_options()
  capture_output(mpt_options("test"))
  mpt_options("n.CPU" = 1)  ## use 1 CPU, so it can run on CRAN
  set.seed(10)  ## for reproducibility
  
  only_asymptotic <- fit_mpt(
    method = "asymptotic_no"
    , dataset = DATA_FILE
    , data = data
    , model = EQN_FILE
    , condition = COL_CONDITION
  )
  expect_equal(nrow(only_asymptotic), 1)
  expect_equal(only_asymptotic$pooling, "no")
  expect_equal(only_asymptotic$method, "asymptotic")
  
  ## dput(round(only_asymptotic$est_group[[1]]$est, 3))
  expect_equal(only_asymptotic$est_group[[1]]$est, 
               c(0.933, 0.903, 0.701, 0.887, 0.922, 0.972, 0.912, 0.75), 
               tolerance = 0.001)
  
  # dput(round(only_asymptotic$gof_group[[1]]$stat_obs, 2))
  expect_equal(only_asymptotic$gof_group[[1]]$stat_obs, 
               c(27.2, 31.75), 
               tolerance = 0.01)
  
  expect_equal(only_asymptotic$est_indiv[[1]]$se, 
               c(NA, NA, NA, NA, NA, NA, NA, NA, 0.02, 0.02, 0.05, 0.19, NA, 
                 NA, NA, NA, 0.02, 0.02, 0.06, 0.17, NA, NA, NA, NA, NA, NA, NA, 
                 NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 
                 NA), 
               tolerance = 0.01)
  
  ## required to skip remaining if not using latest RNG
  testthat::skip_if(getRversion() < "3.6.0")
  
  only_pb <- fit_mpt(
    method = "pb_no"
    , dataset = DATA_FILE
    , data = data
    , model = EQN_FILE
    , condition = COL_CONDITION
  )
  expect_equal(nrow(only_pb), 1)
  expect_equal(only_pb$pooling, "no")
  expect_equal(only_pb$method, "PB/MLE")
  
  ### NOTE: ordering of conditions differs between asymptotic and PB!

  ## dput(round(only_pb$est_group[[1]]$est, 3))
  expect_equal(only_pb$est_group[[1]]$est, 
               c(0.933, 0.903, 0.701, 0.887, 0.922, 0.972, 0.912, 0.75), 
               tolerance = 0.001)
  
  # dput(round(only_pb$gof_group[[1]]$stat_obs, 2))
  expect_equal(only_pb$gof_group[[1]]$stat_obs, 
              c(27.2, 31.75), 
               tolerance = 0.01)
  
  # dput(round(only_pb$gof_group[[1]]$p, 2))
  expect_equal(only_pb$gof_group[[1]]$p, 
              c(0.09, 0.09), 
               tolerance = 0.01)
  
  
  # dput(round(only_pb$est_indiv[[1]]$est, 2))
  expect_equal(only_pb$est_indiv[[1]]$est, 
               c(0.97, 1, 1, 0.81, 0.98, 0.88, 1, 0.69, 0.89, 0.88, 0.22, 1, 
                 0.91, 0.93, 1, 0.94, 0.92, 0.82, 0.28, 1, 0.79, 0.95, 1, 0.31, 
                 0.9, 0.97, 1, 0.81, 0.95, 1, 0.47, 1, 0.91, 0.95, 1, 0.87, 0.98, 
                 0.97, 1, 0.88, 1, 1, 1, 0.62), 
               tolerance = 0.01)
  
  # dput(round(only_pb$est_indiv[[1]]$se, 2))
  expect_equal(only_pb$est_indiv[[1]]$se, 
               c(0.02, 0, 0, 0.09, 0.02, 0.04, 0, 0.1, 0.06, 0.03, 0.34, 0.34, 
                 0.04, 0.04, 0, 0.08, 0.03, 0.04, 0.32, 0.27, 0.06, 0.02, 0, 0.14, 
                 0.04, 0.02, 0, 0.09, 0.02, 0, 0.28, 0.24, 0.03, 0.02, 0, 0.05, 
                 0.01, 0.02, 0, 0.09, 0, 0, 0, 0.12), 
               tolerance = 0.01)
  
  
  only_npb <- fit_mpt(
    method = "npb_no"
    , dataset = DATA_FILE
    , data = data
    , model = EQN_FILE
    , condition = COL_CONDITION
  )
  expect_equal(nrow(only_npb), 1)
  expect_equal(only_npb$pooling, "no")
  expect_equal(only_npb$method, "NPB/MLE")
  
  ## dput(round(only_npb$est_group[[1]]$est, 3))
  expect_equal(only_npb$est_group[[1]]$est, 
               c(0.933, 0.903, 0.701, 0.887, 0.922, 0.972, 0.912, 0.75), 
               tolerance = 0.001)
  
  # dput(round(only_npb$gof_group[[1]]$stat_obs, 2))
  expect_equal(only_npb$gof_group[[1]]$stat_obs, 
              c(27.2, 31.75), 
               tolerance = 0.01)
  
  # dput(round(only_npb$gof_group[[1]]$p, 2))
  expect_equal(only_npb$gof_group[[1]]$p, 
              c(0.64, 1), 
               tolerance = 0.01)
  
  
  # dput(round(only_npb$est_indiv[[1]]$est, 2))
  expect_equal(only_npb$est_indiv[[1]]$est, 
               c(0.97, 1, 1, 0.81, 0.98, 0.88, 1, 0.69, 0.89, 0.88, 0.22, 1, 
                 0.91, 0.93, 1, 0.94, 0.92, 0.82, 0.28, 1, 0.79, 0.95, 1, 0.31, 
                 0.9, 0.97, 1, 0.81, 0.95, 1, 0.47, 1, 0.91, 0.95, 1, 0.87, 0.98, 
                 0.97, 1, 0.88, 1, 1, 1, 0.62), 
               tolerance = 0.01)
  
  # dput(round(only_npb$est_indiv[[1]]$se, 2))
  expect_equal(only_npb$est_indiv[[1]]$se, 
               c(0.02, 0, 0, 0.09, 0.01, 0.03, 0, 0.14, 0.04, 0.05, 0.33, 0.3, 
                 0.02, 0.03, 0, 0.07, 0.03, 0.04, 0.36, 0.36, 0.05, 0.02, 0, 0.13, 
                 0.04, 0.03, 0, 0.11, 0.04, 0, 0.23, 0.21, 0.05, 0.03, 0, 0.08, 
                 0.02, 0.02, 0, 0.06, 0, 0, 0, 0.08), 
               tolerance = 0.01)

  mpt_options(op)
})


test_that("Complete-pooling approaches work", {
  
  ##testthat::skip_on_cran()
  
  EQN_FILE <- system.file("extdata", "prospective_memory.eqn", package = "MPTmultiverse")
  DATA_FILE <- system.file("extdata", "smith_et_al_2011.csv", package = "MPTmultiverse")
  
  data <- read.csv(DATA_FILE, fileEncoding = "UTF-8-BOM")
  data <- data[c(1:5, 113:118),]
  COL_CONDITION <- "WM_EX"
  data[[COL_CONDITION]] <- factor(
    data[[COL_CONDITION]]
    , levels = 1:2
    , labels = c("low_WM", "high_WM")
  )
  op <- mpt_options()
  capture_output(mpt_options("test"))
  mpt_options("n.CPU" = 1)  ## use 1 CPU, so it can run on CRAN
  set.seed(10)  ## for reproducibility
  
  only_asymptotic <- fit_mpt(
    method = "asymptotic_complete"
    , dataset = DATA_FILE
    , data = data
    , model = EQN_FILE
    , condition = COL_CONDITION
  )
  expect_equal(nrow(only_asymptotic), 1)
  expect_equal(only_asymptotic$pooling, "complete")
  expect_equal(only_asymptotic$method, "asymptotic")
  
  ## dput(round(only_asymptotic$est_group[[1]]$est, 3))
  expect_equal(only_asymptotic$est_group[[1]]$est, 
               c(0.933, 0.902, 0.587, 1, 0.922, 0.972, 0.822, 0.809), 
               tolerance = 0.001)
  
  # dput(round(only_asymptotic$gof_group[[1]]$stat_obs, 2))
  expect_equal(only_asymptotic$gof_group[[1]]$stat_obs, 
               c(6.86, 4.93), 
               tolerance = 0.01)
  
  expect_equal(only_asymptotic$est_indiv[[1]], tibble())
  
  expect_equal(only_asymptotic$gof[[1]]$p, 
               0.117, 
               tolerance = 0.001)
  mpt_options(op)
  
})
