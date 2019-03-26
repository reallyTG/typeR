context("Tests Bayesian regression code (rrreg.bayes)")

rm(list=ls())

## Define design parameters
p <- 2/3  # probability of answering honestly in Forced Response Design
p1 <- 1/6 # probability of forced 'yes'
p0 <- 1/6 # probability of forced 'no'

set.seed(1)

## starting values constructed from MLE model
mle.estimates <- rrreg(rr.q1 ~ cov.asset.index + cov.married + 
                         I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female, 
                       data = nigeria, 
                       p = p, p1 = p1, p0 = p0,
                       design = "forced-known")

library(MASS)
draws <- mvrnorm(n = 3, mu = coef(mle.estimates), 
                 Sigma = vcov(mle.estimates) * 9)

test_that("basic code runs with all defaults", {  
  bayes <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                         I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                       data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001, 
                       design = "forced-known")
  expect_is(bayes, "rrreg.bayes")
  expect_equal(ncol(bayes$beta), 7)
})

test_that("basic code runs varying the burnin / thin / n.draws options", {
  
  expect_is(
    bayes <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001,
                         n.draws = 250, burnin = 100,
                         design = "forced-known"),
    "rrreg.bayes"
  )
  
  expect_is(
    bayes <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001,
                         n.draws = 250, burnin = 100, thin = 10,
                         design = "forced-known"),
    "rrreg.bayes"
  )
  
})


test_that("basic code runs setting customized Metropolis options", {
  
  expect_is(
    bayes <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001, 
                         beta.start = draws[1,],
                         n.draws = 500, burnin = 250, thin = 1,
                         design = "forced-known"),
    "rrreg.bayes"
  )
  
  expect_is(
    bayes <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001, 
                         beta.start = draws[1,], beta.mu0 = rep(0, 7), 
                         beta.A0 = diag(7) * 1,
                         n.draws = 500, burnin = 250, thin = 1,
                         design = "forced-known"),
    "rrreg.bayes"
  )
  
  
})

test_that("standard functions coef, sd.rrreg.bayes, summary work", {
  
  bayes <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                         I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                       data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001, 
                       n.draws = 500, burnin = 250, thin = 1,
                       design = "forced-known")
  
  expect_equal(
    length(coef(bayes)$beta), 7
  )
  expect_is(
    coef(bayes)$beta, "numeric"
  )
  expect_is(
    vcov(bayes), "matrix" 
  )
  expect_equal(
    length(sd.rrreg.bayes(bayes)$beta), 7
  )
  
  expect_output(
    print(bayes), "Randomized Response Technique Bayesian Regression"
  )
  
  expect_output(
    print(summary(bayes)), "Individual-level predictors"
  )
  
  expect_is(
    as.list(bayes), "rrreg.bayes.list"
    )
  
}) 

test_that("doing multiple chains works as well as coef, sd.rrreg.bayes, summary work", {
  
  bayes.1 <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0,
                         beta.tune = .0001, beta.start = draws[1,],
                         n.draws = 500, burnin = 250, thin = 1,
                         design = "forced-known")
  
  bayes.2 <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0,
                         beta.tune = .0001, beta.start = draws[2,],
                         n.draws = 500, burnin = 250, thin = 1,
                         design = "forced-known")
  
  bayes.3 <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0,
                         beta.tune = .0001, beta.start = draws[3,],
                         n.draws = 500, burnin = 250, thin = 1,
                         design = "forced-known")
  
  bayes <- as.list(bayes.1, bayes.2, bayes.3)
  
  expect_is(bayes, "rrreg.bayes.list")
  
  expect_equal(
    length(coef(bayes)$beta), 7
  )
  expect_is(
    coef(bayes)$beta, "numeric"
  )
  expect_is(
    vcov(bayes), "matrix" 
  )
  expect_equal(
    length(sd.rrreg.bayes.list(bayes)$beta), 7
  )
  
  expect_output(
    print(bayes), "Randomized Response Technique Bayesian Regression"
  )
  
  summ <- summary(bayes)
  
  expect_output(
    print(summ), "Individual-level predictors"
  )
  
  expect_output(
    print(summ), "Gelman-Rubin statistics"
  )
  
}) 
