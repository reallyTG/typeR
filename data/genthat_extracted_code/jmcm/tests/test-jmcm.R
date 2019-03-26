context("test-jmcm.R")

test_that("multiplication works", {
  ##################################################
  ########## EXAMPLE: CATTLEDATA ###################
  ##################################################
  expect_that(cattleA <- subset(cattle, group == "A"), 
              is_a("data.frame"))
  
  expect_that(fit1 <- jmcm(weight | id | I(day / 14 + 1) ~ 1 | 1, data = cattleA,
                           triple = c(8, 3, 4), cov.method = "mcd"), 
              is_a("jmcmMod"))
  expect_that(getJMCM(fit1, "BIC"), equals(53.44076, tolerance=1e-5))
  expect_that(getJMCM(fit1, "loglik"), equals(-771.0007, tolerance=1e-5))
  
  expect_that(fit2 <- jmcm(weight | id | I(day / 14 + 1) ~ 1 | 1, data = cattleA,
                           triple = c(8, 3, 4), cov.method = "acd"), 
              is_a("jmcmMod"))
  expect_that(getJMCM(fit2, "BIC"), equals(51.88734, tolerance=1e-5))
  expect_that(getJMCM(fit2, "loglik"), equals(-747.6994, tolerance=1e-5))

  expect_that(fit3 <- jmcm(weight | id | I(day / 14 + 1) ~ 1 | 1, data = cattleA,
                           triple = c(8, 2, 2), cov.method = "hpc"), 
              is_a("jmcmMod"))
  expect_that(getJMCM(fit3, "BIC"), equals(51.49394, tolerance=1e-5))
  expect_that(getJMCM(fit3, "loglik"), equals(-746.9001, tolerance=1e-5))
  
  ##################################################
  ##########    EXAMPLE: CD4+   ####################
  ##################################################
  expect_that(fit4 <- jmcm(I(sqrt(cd4)) | id | time ~ 1 | 1, data = aids,
                           triple = c(8, 1, 3), cov.method = "mcd"), 
              is_a("jmcmMod"))
  expect_that(getJMCM(fit4, "BIC"), equals(27.22777, tolerance=1e-5))
  expect_that(getJMCM(fit4, "loglik"), equals(-4979.193, tolerance=1e-5))
  
  expect_that(fit5 <- jmcm(I(sqrt(cd4)) | id | time ~ 1 | 1, data = aids,
                           triple = c(8, 1, 3), cov.method = "acd"),
              is_a("jmcmMod"))
  expect_that(getJMCM(fit5, "BIC"), equals(26.94755, tolerance=1e-5))
  expect_that(getJMCM(fit5, "loglik"), equals(-4927.492, tolerance=1e-5))
  
  expect_that(fit6 <- jmcm(I(sqrt(cd4)) | id | time ~ 1 | 1, data = aids,
                           triple = c(8, 1, 1), cov.method = "hpc"),
              is_a("jmcmMod"))
  expect_that(getJMCM(fit6, "BIC"), equals(26.72683, tolerance=1e-5))
  expect_that(getJMCM(fit6, "loglik"), equals(-4892.679, tolerance=1e-5))
})
