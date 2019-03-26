context("Tests Bayesian regression code (rrreg.bayes) with mixed effects")

rm(list=ls())

## Define design parameters
p <- 2/3  # probability of answering honestly in Forced Response Design
p1 <- 1/6 # probability of forced 'yes'
p0 <- 1/6 # probability of forced 'no'

nigeria$county <- sample(1:10, nrow(nigeria), replace = T)

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
                       Psi.tune = .001, group.mixed = "county",
                       design = "forced-known")
  
  expect_is(bayes, "rrreg.bayes")
  
  expect_equal(ncol(bayes$beta), 7)
  expect_equal(ncol(bayes$gamma), 10)
  expect_equal(ncol(bayes$Psi), 1)
  
})

test_that("basic code runs varying the burnin / thin / n.draws options", {

  expect_is(
    bayes <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001,
                         Psi.tune = .001, group.mixed = "county",
                         n.draws = 250, burnin = 100,
                         design = "forced-known"),
    "rrreg.bayes"
  )
  
  expect_is(
    bayes <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001,
                         Psi.tune = .001, group.mixed = "county",
                         n.draws = 250, burnin = 100, thin = 10,
                         design = "forced-known"),
    "rrreg.bayes"
  )
  
})


test_that("basic code runs setting customized Metropolis options", {
  skip_on_cran()
  
  expect_is(
    bayes <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001, 
                         Psi.tune = .001, group.mixed = "county",
                         beta.start = draws[1,],
                         n.draws = 250, burnin = 100, thin = 10,
                         design = "forced-known"),
    "rrreg.bayes"
  )
  
  expect_is(
    bayes <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001, 
                         Psi.tune = .001, group.mixed = "county",
                         beta.start = draws[1,], beta.mu0 = rep(0, 7), 
                         beta.A0 = diag(7) * 1,
                         n.draws = 250, burnin = 100, thin = 10,
                         design = "forced-known"),
    "rrreg.bayes"
  )
  
  
})

test_that("basic code runs setting customized Metropolis options for mixed effects", {
  
  expect_is(
    bayes <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001, 
                         Psi.tune = .001, group.mixed = "county",
                         Psi.start = 20, Psi.df = 3, Psi.scale = .1,
                         n.draws = 250, burnin = 100, thin = 10,
                         design = "forced-known"),
    "rrreg.bayes"
  )

})

test_that("basic code runs when there are covariates sent to the mixed model",{
  
  bayes.mixed.cov <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                                   I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                                 data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001, 
                                 Psi.tune = .001, group.mixed = "county",
                                 Psi.start = 20, Psi.df = 3, Psi.scale = .1,
                                 n.draws = 250, burnin = 100, thin = 10,
                                 design = "forced-known", formula.mixed = ~ cov.education)
  
  expect_equal(
    length(coef(bayes.mixed.cov)$beta), 7
  )
  expect_is(
    coef(bayes.mixed.cov)$beta, "numeric"
  )
  expect_equal(
    length(coef(bayes.mixed.cov, ranef = T)$gamma), 20
  )
  expect_is(
    coef(bayes.mixed.cov, ranef = T)$gamma, "numeric"
  )
  expect_equal(
    length(coef(bayes.mixed.cov, ranef = T)$Psi), 3
  )
  expect_is(
    coef(bayes.mixed.cov, ranef = T)$Psi, "numeric"
  )
  expect_equal(
    length(coef(bayes.mixed.cov)), 1
  )
  expect_equal(
    length(coef(bayes.mixed.cov, ranef = T)), 3
  )
  
  expect_is(
    vcov(bayes.mixed.cov), "matrix" 
  )
  expect_equal(
    length(sd.rrreg.bayes(bayes.mixed.cov)$beta), 7
  )
  
  expect_output(
    print(bayes.mixed.cov), "Randomized Response Technique Bayesian Regression"
  )
  
  expect_output(
    print(summary(bayes.mixed.cov)), "Individual-level predictors"
  )
  
  expect_is(
    as.list(bayes.mixed.cov), "rrreg.bayes.list"
  )
  
  expect_equal(names(coef(bayes.mixed.cov, ranef = T)$Psi), 
               c("(Intercept) (Intercept)", "cov.education (Intercept)",
                 "cov.education cov.education"))
  
  expect_equal(names(sd.rrreg.bayes(bayes.mixed.cov, ranef = T)$Psi), 
               c("(Intercept) (Intercept)", "cov.education (Intercept)",
                 "cov.education cov.education"))
  
          
})

test_that("standard functions coef, sd.rrreg.bayes, summary work", {
  
  bayes <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                         I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                       data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001, 
                       Psi.tune = .001, group.mixed = "county",
                       n.draws = 500, burnin = 250, thin = 1,
                       design = "forced-known")
  
  expect_equal(
    length(coef(bayes)$beta), 7
  )
  expect_is(
    coef(bayes)$beta, "numeric"
  )
  expect_equal(
    length(coef(bayes, ranef = T)$gamma), 10
  )
  expect_is(
    coef(bayes, ranef = T)$gamma, "numeric"
  )
  expect_equal(
    length(coef(bayes, ranef = T)$Psi), 1
  )
  expect_is(
    coef(bayes, ranef = T)$Psi, "numeric"
  )
  expect_equal(
    length(coef(bayes)), 1
  )
  expect_equal(
    length(coef(bayes, ranef = T)), 3
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
  
  expect_equal(names(coef(bayes, ranef = T)$Psi), 
               c("(Intercept) (Intercept)"))
  
  expect_equal(names(sd.rrreg.bayes(bayes, ranef = T)$Psi), 
               c("(Intercept) (Intercept)"))
  
}) 

test_that("using string, numeric, or factor group variable gets the same answer", {
  
  nigeria$county.fac <- as.factor(sample(c("aa 1", "bb 2", "cc 3"), nrow(nigeria), replace = T))
  nigeria$county.str <- as.character(nigeria$county.fac)
  nigeria$county.num <- as.numeric(nigeria$county.fac)
  
  set.seed(1)
  bayes.num <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                         I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                       data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001, 
                       Psi.tune = .001, group.mixed = "county.num",
                       n.draws = 500, burnin = 250, thin = 1,
                       design = "forced-known")
 
  set.seed(1)
  bayes.str <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                             I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                           data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001, 
                           Psi.tune = .001, group.mixed = "county.str",
                           n.draws = 500, burnin = 250, thin = 1,
                           design = "forced-known")
  
  set.seed(1)
  bayes.fac <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                             I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                           data = nigeria, p = p, p1 = p1, p0 = p0, beta.tune = .0001, 
                           Psi.tune = .001, group.mixed = "county.fac",
                           n.draws = 500, burnin = 250, thin = 1,
                           design = "forced-known")
  
  expect_equal(as.numeric(coef(bayes.num, ranef = T)$gamma[which(names(coef(bayes.num, 
                                                               ranef = T)$gamma) == "2")]),
             as.numeric(coef(bayes.fac, ranef = T)$gamma[which(names(coef(bayes.fac, 
                                                               ranef = T)$gamma) == "bb 2")]))
  
  expect_equal(as.numeric(coef(bayes.num, ranef = T)$gamma[which(names(coef(bayes.num, 
                                                                            ranef = T)$gamma) == "2")]),
               as.numeric(coef(bayes.str, ranef = T)$gamma[which(names(coef(bayes.str, 
                                                                            ranef = T)$gamma) == "bb 2")]))
  
})

test_that("doing multiple chains works as well as coef, sd.rrreg.bayes, summary work", {
  
  bayes.1 <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0,
                         Psi.tune = .001, group.mixed = "county",
                         beta.tune = .0001, beta.start = draws[1,],
                         n.draws = 500, burnin = 250, thin = 1,
                         design = "forced-known")
  
  bayes.2 <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0,
                         Psi.tune = .001, group.mixed = "county",
                         beta.tune = .0001, beta.start = draws[2,],
                         n.draws = 500, burnin = 250, thin = 1,
                         design = "forced-known")
  
  bayes.3 <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
                           I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                         data = nigeria, p = p, p1 = p1, p0 = p0,
                         Psi.tune = .001, group.mixed = "county",
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
  expect_equal(
    length(coef(bayes, ranef = T)$gamma), 10
  )
  expect_is(
    coef(bayes, ranef = T)$gamma, "numeric"
  )
  expect_equal(
    length(coef(bayes, ranef = T)$Psi), 1
  )
  expect_is(
    coef(bayes, ranef = T)$Psi, "numeric"
  )
  expect_equal(
    length(coef(bayes)), 1
  )
  expect_equal(
    length(coef(bayes, ranef = T)), 3
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
