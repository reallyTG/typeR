testthat::context("Testing the mtlr_cv function. Most tests are just checking against stored values.")



# mtlr_cv ------------------------------------------------------------
testthat::test_that("mtlr_cv function is consistent for basic survival dataset",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  expect_equal_to_reference(mtlr_cv(formula,data),"mtlrcv_leuk.rds", tolerance = 1e-3)
})

testthat::test_that("mtlr_cv function is consistent when ignoring previous weights",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  expect_equal_to_reference(mtlr_cv(formula,data,previous_weights = F),"mtlrcv_leukNoPrev.rds", tolerance = 1e-3)
})

testthat::test_that("mtlr_cv function is consistent for concordance loss",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  expect_equal_to_reference(mtlr_cv(formula,data, loss = "concordance"),"mtlrcv_leukConcordance.rds", tolerance = 1e-3)
})


testthat::test_that("mtlr_cv function is consistent for more complex survival dataset",{
  formula <- survival::Surv(time,status)~.
  data <- survival::lung
  skip_on_cran()
  skip_on_travis()
  expect_equal_to_reference(mtlr_cv(formula,data),"mtlrcv_lung.rds")
  data$status <- 0
  expect_equal_to_reference(mtlr_cv(formula,data),"mtlrcv_censored.rds")
  data$status <- 1
  expect_equal_to_reference(mtlr_cv(formula,data),"mtlrcv_uncensored.rds")
})

testthat::test_that("mtlr_cv function catches errors survival dataset",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  data <- data[data$status == 1,]
  C1_vec <- c(-1,1)
  expect_error(mtlr_cv(formula,data,C1_vec = C1_vec),"All values of C1 must be non-negative.")
  expect_error(mtlr_cv(formula,data.frame()),"Dimensions of the dataset must be non-zero.")
})


testthat::test_that("mtlr_cv function works with multiple types of censoring",{
  time1 <- c(NA, 4, 7, 12, 10, 6, NA, 3,5,9,10,12,NA,4,6,2,NA,16,15,11)
  time2 <- c(14, 4, 10, 12, NA, 9, 5, NA, NA, NA, NA, 15,22,4,8,6,2,20,23,11)
  set.seed(42)
  dat <- cbind.data.frame(time1, time2, importantfeature1 = rnorm(20),importantfeature2 = rnorm(20),
                         importantfeature3 = rnorm(20),importantfeature4 = rnorm(20),importantfeature5 = rnorm(20),
                         importantfeature6 = rbinom(20,1,.3),importantfeature7 = rbinom(20,1,.3))
  formula <- survival::Surv(time1,time2,type = "interval2")~.
  skip_on_cran()
  skip_on_travis()
  expect_equal_to_reference(mtlr_cv(formula, dat, C1_vec = c(.001,.01,.1,0), previous_weights=F ),"mtlrcv_mixed_censoring.rds")
})



