
context("MPTinR: Identifiability of individual parameters")

test_that("Non-identified parameters are excluded", {
  
  testthat::skip_on_cran()
  testthat::skip_on_travis()
  
  op <- mpt_options()
  mpt_options("default")
  mpt_options("bootstrap_samples" = 200)
  mpt_options(n.optim = 5)
  
  EQN_FILE <- system.file("extdata", "prospective_memory.eqn", package = "MPTmultiverse")
  DATA_FILE <- system.file("extdata", "smith_et_al_2011.csv", package = "MPTmultiverse")
  
  
  
  data <- read.csv(DATA_FILE, fileEncoding = "UTF-8-BOM")
  data <- data[c(10:15, 110:115),]
  COL_CONDITION <- "WM_EX"
  data[[COL_CONDITION]] <- factor(
    data[[COL_CONDITION]]
    , levels = 1:2
    , labels = c("low_WM", "high_WM")
  )
  
  set.seed(99)
  
  expect_warning(only_pb <- fit_mpt(
    method = "pb_no"
    , dataset = DATA_FILE
    , data = data
    , model = EQN_FILE
    , condition = COL_CONDITION
  ), "MPTinR-no: IDs and parameters with pb-CIs > 0.99 (i.e., non-identified)", 
  fixed = TRUE)
  
  mpt_options(n.optim = 20)
  
  set.seed(11)
  only_asymptotic <- fit_mpt(
    method = "asymptotic_no"
    , dataset = DATA_FILE
    , data = data
    , model = EQN_FILE
    , condition = COL_CONDITION
  )
  
  expect_equivalent(only_pb$est_indiv[[1]]$est, 
                    only_asymptotic$est_indiv[[1]]$est, 
                    tolerance = 0.001)
  
  expect_false(isTRUE(all.equal(only_pb$est_indiv[[1]]$se, 
                                only_asymptotic$est_indiv[[1]]$se, 
                                tolerance = 0.001)))
  ## check for group estimates
  expect_false(isTRUE(all.equal(
    only_pb$est_group[[1]]$est, 
    only_asymptotic$est_group[[1]]$est, 
    tolerance = 0.001)))
  
  ## check for group differences
  expect_false(isTRUE(all.equal(
    only_pb$test_between[[1]]$est_diff, 
    only_asymptotic$test_between[[1]]$est_diff, 
    tolerance = 0.001)))
  
  mpt_options(op)  # reset options
})
