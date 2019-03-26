testthat::context("Testing the primary mtlr function.")



# mtlr ------------------------------------------------------------
testthat::test_that("mtlr function is consistent for basic survival dataset",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  expect_equal_to_reference(mtlr(formula,data),"mtlr_leuk.rds")
})

testthat::test_that("mtlr function doesn't fail for 0 varaince features",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  data$x <- 1
  expect_warning(mtlr(formula,data))
})

testthat::test_that("mtlr function is consistent for more complex survival dataset",{
  formula <- survival::Surv(time,status)~.
  data <- survival::lung
  expect_equal_to_reference(mtlr(formula,data),"mtlr_lung.rds")
})

testthat::test_that("mtlr function is consistent for more complex survival dataset - no extra bias training",{
  formula <- survival::Surv(time,status)~.
  data <- survival::lung
  expect_equal_to_reference(mtlr(formula,data, train_biases = F),"mtlr_lung_nobias.rds")
})

testthat::test_that("mtlr function is consistent for all censored survival dataset",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  data <- data[data$status == 0,]
  expect_equal_to_reference(mtlr(formula,data),"mtlr_censored.rds")
})

testthat::test_that("mtlr function is consistent for all uncensored survival dataset",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  data <- data[data$status == 1,]
  expect_equal_to_reference(mtlr(formula,data),"mtlr_uncensored.rds")
})

testthat::test_that("mtlr function is consistent for basic survival dataset UNNORMALIZED",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  expect_equal_to_reference(mtlr(formula,data, normalize = F),"mtlr_leukUNNORMALIZED.rds")
})

testthat::test_that("mtlr function is consistent for basic survival dataset for chosen nintervals",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  expect_equal_to_reference(mtlr(formula,data, nintervals = 3),"mtlr_leuk_timepoints.rds")
})

testthat::test_that("mtlr function works with left censoring",{
  formula <- survival::Surv(time,status, type = "left")~.
  data <- survival::lung
  expect_equal_to_reference(mtlr(formula,data),"mtlr_leuk_left.rds")
})

testthat::test_that("mtlr function works with multiple types of censoring",{
  time1 <- c(NA, 4, 7, 12, 10, 6, NA, 3,5,9,10,12,NA,4,6,2,NA,16,15,11)
  time2 <- c(14, 4, 10, 12, NA, 9, 5, NA, NA, NA, NA, 15,22,4,8,6,2,20,23,11)
  set.seed(42)
  dat <- cbind.data.frame(time1, time2, importantfeature1 = rnorm(20),importantfeature2 = rnorm(20),
                         importantfeature3 = rnorm(20),importantfeature4 = rnorm(20),importantfeature5 = rnorm(20),
                         importantfeature6 = rbinom(20,1,.3),importantfeature7 = rbinom(20,1,.3))
  formula <- survival::Surv(time1,time2,type = "interval2")~.
  expect_equal_to_reference(mtlr(formula, dat),"mtlr_mixed_censoring.rds", tolerance = 1e-3)
})



testthat::test_that("mtlr argument specifications are working.",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  data$time[1] <- -10
  expect_error(mtlr(formula,data),"All event times must be non-negative")
  data$time[1] <- 10

  formula <- time~.
  expect_error(mtlr(formula,data),"The response must be a Surv object.")

  formula <- survival::Surv(time,status)~.

  expect_error(mtlr(formula,data, C1 = -10),"C1 must be non-negative.")
  expect_error(mtlr(formula,data, C1 = -1e-10),"C1 must be non-negative.")
  expect_error(mtlr(formula,data, threshold = -1e-10),"The threshold must be positive.")
  expect_error(mtlr(formula,data, threshold = 0),"The threshold must be positive.")
  expect_error(mtlr(formula,data.frame()),"Dimensions of the dataset must be non-zero.")

})

testthat::test_that("when training mtlr fails optim error is caught",{
  formula <- survival::Surv(time,status)~.
  data <- survival::lung
  data$meal.cal <- data$meal.cal*1e100
  expect_error(mtlr(formula,data,normalize = F))

})















