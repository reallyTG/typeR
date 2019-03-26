library(testthat)
library(glm.deploy)

context("glm.deploy")

test_that("Multiple family regression and link functions work",{
  ##Examples with the iris dataset with a Logical intercept and numeric variables
  data(iris)
  iristest = iris
  iristest$Virginica = ifelse(iristest$Species == 'virginica', TRUE,FALSE)
  iristest$Species = NULL

  #####Family Binomial####
  #Link: logit####
  model1 <- glm(Virginica ~ ., family = binomial(logit), data=iristest)
  #Link: probit####
  model2 <- glm(Virginica ~ ., family = binomial(probit), data=iristest)
  #Link: cloglog####
  model3 <- glm(Virginica ~ ., family = binomial(cloglog), data=iristest)

  #####Family Gaussian####
  #Link: identity####
  model4<- glm(Virginica ~ ., family = gaussian(identity), data=iristest)

  #####Family Poisson####
  #Link: log####
  model5 <- glm(Virginica ~ ., family = poisson(log), data=iristest)
  #Link: identity####
  model6 <- glm(Virginica ~ ., family = poisson(identity),start=c(TRUE,6.8,3.2,5.9,2.3), data=iristest)
  #Link: sqrt####
  model7 <- glm(Virginica ~ ., family = poisson(sqrt),start=c(TRUE,0.5,0.5,0.5,0.5), data=iristest)

  #####Family quasi####
  #Link: identity####
  model8 <- glm(Virginica ~ ., family = quasi, data=iristest)

  ##Examples with the iris dataset with a numerical intercept with numerical and factor variables
  data(iris)
  iristest = iris
  iristest$Virginica = ifelse(iristest$Species == 'virginica', 'Yes','No')
  iristest$Virginica = as.factor(iristest$Virginica)
  iristest$Species = NULL

  #####Family Gamma####
  #Link: identity####
  model9 <- glm(Sepal.Length ~ ., family = Gamma(identity), data=iristest)
  #Link: log####
  model10 <- glm(Sepal.Length ~ ., family = Gamma(log), data=iristest)
  #Link: inverse####
  model11 <- glm(Sepal.Length ~ ., family = Gamma(inverse), data=iristest)

  #####Family inverse.gaussian####
  #Link: 1/mu^2####
  model12 <- glm(Sepal.Length ~ ., family = inverse.gaussian, data=iristest)

  expect_is(model1, "glm")
  expect_is(model2, "glm")
  expect_is(model3, "glm")
  expect_is(model4, "glm")
  expect_is(model5, "glm")
  expect_is(model6, "glm")
  expect_is(model7, "glm")
  expect_is(model8, "glm")
  expect_is(model9, "glm")
  expect_is(model10, "glm")
  expect_is(model11, "glm")
  expect_is(model12, "glm")

  glm2c(model1, "Binomial_logit", tempdir())
  glm2c(model2, "Binomial_probit", tempdir())
  glm2c(model3, "Binomial_cloglog", tempdir())
  glm2c(model4, "Gaussian_identity", tempdir())
  glm2c(model5, "Poisson_log", tempdir())
  glm2c(model6, "Poisson_identity", tempdir())
  glm2c(model7, "Poisson_sqrt", tempdir())
  glm2c(model8, "quasi_identity", tempdir())
  glm2c(model9, "Gamma_identity", tempdir())
  glm2c(model10, "Gamma_log", tempdir())
  glm2c(model11, "Gamma_inverse", tempdir())
  glm2c(model12, "InverseGaussian_mu", tempdir())


  glm2java(model1, "Binomial_logit", tempdir())
  glm2java(model2, "Binomial_probit", tempdir())
  glm2java(model3, "Binomial_cloglog", tempdir())
  glm2java(model4, "Gaussian_identity", tempdir())
  glm2java(model5, "Poisson_log", tempdir())
  glm2java(model6, "Poisson_identity", tempdir())
  glm2java(model7, "Poisson_sqrt", tempdir())
  glm2java(model8, "quasi_identity", tempdir())
  glm2java(model9, "Gamma_identity", tempdir())
  glm2java(model10, "Gamma_log", tempdir())
  glm2java(model11, "Gamma_inverse", tempdir())
  glm2java(model12, "InverseGaussian_mu", tempdir())

  expect_equal(file.exists(paste0(tempdir(),"/Binomial_logit.c")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Binomial_probit.c")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Binomial_cloglog.c")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Gaussian_identity.c")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Poisson_log.c")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Poisson_identity.c")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Poisson_sqrt.c")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/quasi_identity.c")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Gamma_identity.c")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Gamma_log.c")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Gamma_inverse.c")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/InverseGaussian_mu.c")), TRUE)

  expect_equal(file.exists(paste0(tempdir(),"/Binomial_logit_class.java")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Binomial_probit_class.java")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Binomial_cloglog_class.java")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Gaussian_identity_class.java")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Poisson_log_class.java")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Poisson_identity_class.java")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Poisson_sqrt_class.java")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/quasi_identity_class.java")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Gamma_identity_class.java")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Gamma_log_class.java")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/Gamma_inverse_class.java")), TRUE)
  expect_equal(file.exists(paste0(tempdir(),"/InverseGaussian_mu_class.java")), TRUE)
  #remove(iris,iristest)

  file.remove(paste0(tempdir(),"/Binomial_logit.c"))
  file.remove(paste0(tempdir(),"/Binomial_probit.c"))
  file.remove(paste0(tempdir(),"/Binomial_cloglog.c"))
  file.remove(paste0(tempdir(),"/Gaussian_identity.c"))
  file.remove(paste0(tempdir(),"/Poisson_log.c"))
  file.remove(paste0(tempdir(),"/Poisson_identity.c"))
  file.remove(paste0(tempdir(),"/Poisson_sqrt.c"))
  file.remove(paste0(tempdir(),"/quasi_identity.c"))
  file.remove(paste0(tempdir(),"/Gamma_identity.c"))
  file.remove(paste0(tempdir(),"/Gamma_log.c"))
  file.remove(paste0(tempdir(),"/Gamma_inverse.c"))
  file.remove(paste0(tempdir(),"/InverseGaussian_mu.c"))

  file.remove(paste0(tempdir(),"/Binomial_logit.h"))
  file.remove(paste0(tempdir(),"/Binomial_probit.h"))
  file.remove(paste0(tempdir(),"/Binomial_cloglog.h"))
  file.remove(paste0(tempdir(),"/Gaussian_identity.h"))
  file.remove(paste0(tempdir(),"/Poisson_log.h"))
  file.remove(paste0(tempdir(),"/Poisson_identity.h"))
  file.remove(paste0(tempdir(),"/Poisson_sqrt.h"))
  file.remove(paste0(tempdir(),"/quasi_identity.h"))
  file.remove(paste0(tempdir(),"/Gamma_identity.h"))
  file.remove(paste0(tempdir(),"/Gamma_log.h"))
  file.remove(paste0(tempdir(),"/Gamma_inverse.h"))
  file.remove(paste0(tempdir(),"/InverseGaussian_mu.h"))

  file.remove(paste0(tempdir(),"/Binomial_logit_class.java"))
  file.remove(paste0(tempdir(),"/Binomial_probit_class.java"))
  file.remove(paste0(tempdir(),"/Binomial_cloglog_class.java"))
  file.remove(paste0(tempdir(),"/Gaussian_identity_class.java"))
  file.remove(paste0(tempdir(),"/Poisson_log_class.java"))
  file.remove(paste0(tempdir(),"/Poisson_identity_class.java"))
  file.remove(paste0(tempdir(),"/Poisson_sqrt_class.java"))
  file.remove(paste0(tempdir(),"/quasi_identity_class.java"))
  file.remove(paste0(tempdir(),"/Gamma_identity_class.java"))
  file.remove(paste0(tempdir(),"/Gamma_log_class.java"))
  file.remove(paste0(tempdir(),"/Gamma_inverse_class.java"))
  file.remove(paste0(tempdir(),"/InverseGaussian_mu_class.java"))
})
