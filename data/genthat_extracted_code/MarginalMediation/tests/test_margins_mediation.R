library(testthat)
library(furniture)
library(MarginalMediation)

test_that("Multiple Indirect Effects", {
  fit1 = glm(marijuana ~ home_meals + gender + age + asthma, data = nhanes_2010, family = "binomial")
  fit2 = glm(home_meals ~ gender + age + asthma, data = nhanes_2010, family = "gaussian")
  expect_s3_class(mma(fit1, fit2,
                      ind_effects = c("genderFemale-home_meals",
                                      "age-home_meals",
                                      "asthmaNo-home_meals"),
                      boot = 10), "mma")
  })

test_that("Error catching", {
  fit1 = glm(marijuana ~ home_meals + gender + age + asthma, data = nhanes_2010, family = "binomial")
  fit2 = glm(home_meals ~ gender + age + asthma, data = nhanes_2010, family = "gaussian")
  fit3 = NULL
  expect_error(mma(fit1, fit2,
                  ind_effects = c("genderFemale-home_meals",
                                  "age-home_meals",
                                  "asthmaNo-home_meals",
                                  "genderFemale-age",
                                  "asthmaNo-age"),
                  boot = 10))
  expect_error(mma(fit1, fit2, fit3,
                   ind_effects = c("genderFemale-home_meals",
                                   "age-home_meals",
                                   "asthmaNo-home_meals"),
                   boot = 10))
  expect_error(mma(fit1, fit2,
                   ind_effects = c(1,
                                   "age-home_meals",
                                   "asthmaNo-home_meals"),
                   boot = 10, 
                   ci = 10))
  })


