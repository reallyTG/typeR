testthat::context("Testing the extra utility methods (get_param_influence,log_loss).")

# get_param_influence ------------------------------------------------------------
#Basic test for basic function (mostly to increase code coverage).
testthat::test_that("get_influence functionality",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  mod <- mtlr(formula,data)
  weights <- mod$weight_matrix
  expect_equal(unname(get_param_influence(mod)), sum(abs(weights[,2, drop=FALSE])))
})

# loglik_loss ------------------------------------------------------------

testthat::test_that("loglik_loss functionality all uncensored",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  object <- mtlr(formula,data)

  #All uncensored
  newdata <- survival::leukemia[c(1,2,4,5),]
  curves <- predict(object, newdata)

  time <- curves[,1]
  #We only need one curve because everyone is the same.
  curve <- curves[,2]
  curve_diff <- -diff(c(curve,0))
  ind <- findInterval(newdata$time, time)
  loss <- -sum(log(curve_diff[ind]+1e-05))
  expect_equal(loglik_loss(object,newdata),loss/nrow(newdata))
})

testthat::test_that("log_loss functionality all censored",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  object <- mtlr(formula,data)

  #All uncensored
  newdata <- survival::leukemia[c(3,6,9,11),]
  curves <- predict(object, newdata)

  time <- curves[,1]
  #We only need one curve because everyone is the same.
  curve <- curves[,2]
  probs <- predict_prob(curve,time,newdata$time)

  loss <- -sum(log(probs+1e-05))
  expect_equal(loglik_loss(object,newdata),loss/nrow(newdata))
})

testthat::test_that("log_loss functionality mixed uncensored and censored",{
  formula <- survival::Surv(time,status)~.
  data <- survival::leukemia
  object <- mtlr(formula,data)

  #All uncensored
  newdata <- survival::leukemia[c(1,2,4,5,3,6,9,11),]
  curves <- predict(object, newdata)

  time <- curves[,1]
  #We only need one curve because everyone is the same.
  curve <- curves[,2]
  #Uncensored
  curve_diff <- -diff(c(curve,0))
  ind <- findInterval(newdata$time[1:4], time)
  loss <- -sum(log(curve_diff[ind]+1e-05))

  #Censored
  probs <- predict_prob(curve,time,newdata$time[5:8])
  loss <- loss -sum(log(probs+1e-05))

  expect_equal(loglik_loss(object,newdata),loss/nrow(newdata))
})

testthat::test_that("log_loss functionality mixed uncensored and (left/interval/right) censored",{
  formula <- survival::Surv(time1,time2, type = "interval2")~.
  time1 <- c(NA, 4, 7, 12, 10, 6, NA, 3,5,9,10,12,NA,4,6,2,NA,16,15,11)
  time2 <- c(14, 4, 10, 12, NA, 9, 5, NA, NA, NA, NA, 15,22,4,8,6,2,20,23,11)
  set.seed(42)
  dat <- cbind.data.frame(time1, time2, importantfeature = 1)
  object <- mtlr(formula,dat,normalize = F)

  #All uncensored
  curves <- predict(object)

  time <- curves[,1]
  #We only need one curve because everyone is the same.
  curve <- curves[,2]
  #Uncensored
  curve_diff <- -diff(c(curve,0))
  ind <- findInterval(dat$time1[c(2,4,14,20)], time)
  loss <- -sum(log(curve_diff[ind]+1e-05))

  #Left Censored
  probs <- 1 - predict_prob(curve,time,dat$time2[c(1,7,13,17)])
  loss <- loss -sum(log(probs+1e-05))

  #Right Censored
  probs <- predict_prob(curve,time,dat$time1[c(5,8,9,10,11)])
  loss <- loss -sum(log(probs+1e-05))

  #Interval Censored
  probsU <- predict_prob(curve,time,dat$time1[c(3,6,12,15,16,18,19)])
  probsL <- predict_prob(curve,time,dat$time2[c(3,6,12,15,16,18,19)])
  probs <- probsU - probsL
  loss <- loss -sum(log(probs+1e-05))

  expect_equal(loglik_loss(object,dat),loss/nrow(dat))
})
