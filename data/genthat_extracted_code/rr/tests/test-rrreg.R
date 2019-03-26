context("Tests regression code (rrreg)")

rm(list=ls())

####### FORCED DESIGN ####################

## Define design parameters
p <- 2/3  # probability of answering honestly in Forced Response Design
p1 <- 1/6 # probability of forced 'yes'
p0 <- 1/6 # probability of forced 'no'

## Rescale respondent age covariate
nigeria$cov.age.10 <- nigeria$cov.age/10
nigeria$cov.age.10sq <- nigeria$cov.age.10^2

test_that("rrreg works", {
  skip_on_cran()
  
  #### rrreg
  set.seed(3)
  rr.q1.reg.obj1 <- rrreg(rr.q1 ~ cov.asset.index + cov.married + 
                            cov.age.10 + cov.age.10sq + cov.education + cov.female,   
                          data = nigeria, p = p, p1 = p1, p0 = p0, 
                          design = "forced-known")
  
  summary(rr.q1.reg.obj1)
  
  #change start
  set.seed(1)
  rr.q1.reg.obj2 <- rrreg(rr.q1 ~ cov.asset.index + cov.married + 
                            cov.age.10 + I(cov.age.10^2) + cov.education + cov.female,   
                          data = nigeria, p = p, p1 = p1, p0 = p0, 
                          design = "forced-known", start = c(rep(.02, 7)))
  
  summary(rr.q1.reg.obj2)
  
  #change maxIter
  set.seed(3)
  rr.q1.reg.obj3 <- rrreg(rr.q1 ~ cov.asset.index + cov.married + 
                            cov.age.10 + I(cov.age.10^2) + cov.education + cov.female,   
                          data = nigeria, p = p, p1 = p1, p0 = p0, maxIter = 200, 
                          design = "forced-known")
  
  summary(rr.q1.reg.obj3)
  
  #verbose
  set.seed(2)
  rr.q1.reg.obj4 <- rrreg(rr.q1 ~ cov.asset.index + cov.married + 
                            cov.age.10 + I(cov.age.10^2) + cov.education + cov.female,   
                          data = nigeria, p = p, p1 = p1, p0 = p0, verbose = T,
                          design = "forced-known")
  
  #optim
  set.seed(2)
  rr.q1.reg.obj5 <- rrreg(rr.q1 ~ cov.asset.index + cov.married + 
                            cov.age.10 + I(cov.age.10^2) + cov.education + cov.female,   
                          data = nigeria, p = p, p1 = p1, p0 = p0, optim = TRUE,
                          design = "forced-known")
  
  coef(rr.q1.reg.obj5)
  vcov(rr.q1.reg.obj5)
  
  #em.converge
  set.seed(2)
  rr.q1.reg.obj6 <- rrreg(rr.q1 ~ cov.asset.index + cov.married + 
                            cov.age.10 + I(cov.age.10^2) + cov.education + cov.female,   
                          data = nigeria, p = p, p1 = p1, p0 = p0, em.converge = 10^3,
                          design = "forced-known")
  #glmMaxIter
  set.seed(3)
  rr.q1.reg.obj7 <- rrreg(rr.q1 ~ cov.asset.index + cov.married + 
                            cov.age.10 + I(cov.age.10^2) + cov.education + cov.female,   
                          data = nigeria, p = p, p1 = p1, p0 = p0, glmMaxIter = 50000,
                          design = "forced-known")
  
  #solve.tolerance 
  set.seed(2)
  rr.q1.reg.obj8 <- rrreg(rr.q1 ~ cov.asset.index + cov.married + 
                            cov.age.10 + I(cov.age.10^2) + cov.education + cov.female,   
                          data = nigeria, p = p, p1 = p1, p0 = p0, design = "forced-known",
                          solve.tolerance = 2.220446e-16)
  
  #With only one variable
  set.seed(1)
  rr.q1.reg.obj9 <- rrreg(rr.q1 ~ cov.asset.index, data = nigeria, 
                          p = p, p1 = p1, p0 = p0,
                          design = "forced-known")
  
  #With only intercept
  set.seed(1)
  rr.q1.reg.obj10 <- rrreg(rr.q1 ~ 1, data = nigeria, 
                           p = p, p1 = p1, p0 = p0,
                           design = "forced-known")

  #### predict.rrreg ####
  rr.q1.reg.pred1 <- predict(rr.q1.reg.obj1, given.y = FALSE, 
                             avg = TRUE, quasi.bayes = TRUE, 
                             n.sims = 10000)
  
  #given.y
  rr.q1.reg.pred2 <- predict(rr.q1.reg.obj1, given.y = TRUE, 
                             avg = TRUE, quasi.bayes = TRUE,
                             n.sims = 10000)
  
  #alpha
  rr.q1.reg.pred3 <- predict(rr.q1.reg.obj1, given.y = TRUE, alpha = .1, 
                             avg = TRUE, quasi.bayes = TRUE,
                             n.sims = 10000)
  
  #n.sims
  rr.q1.reg.pred4 <- predict(rr.q1.reg.obj1, given.y = TRUE, 
                             avg = TRUE, quasi.bayes = TRUE, 
                             n.sims = 20000)
  
  #avg
  rr.q1.reg.pred5 <- predict(rr.q1.reg.obj1, given.y = TRUE, 
                             avg = FALSE, quasi.bayes = TRUE, 
                             n.sims = 1000)
  
  #newdata
  rr.q1.reg.pred6 <- predict(rr.q1.reg.obj1, given.y = TRUE, 
                             avg = TRUE, quasi.bayes = TRUE, 
                             newdata = nigeria, 
                             n.sims = 1000)
  
  #newdata without y because given.y = FALSE
  rr.q1.reg.pred6.1 <- predict(rr.q1.reg.obj1, given.y = FALSE, 
                               newdata = nigeria[,c("cov.asset.index", "cov.married", 
                                                    "cov.age", "cov.education", "cov.female", "cov.age.10", "cov.age.10sq")])
  
  #quasi.bayes
  rr.q1.reg.pred7 <- predict(rr.q1.reg.obj1, given.y = TRUE, 
                             avg = TRUE, quasi.bayes = FALSE, 
                             n.sims = 1000)
  
})

test_that("output from rrreg gives us unscaled data, x", {
  
  set.seed(3)
  rr.q1.reg.obj1 <- rrreg(rr.q1 ~ cov.asset.index + cov.married + 
                            cov.age.10 + cov.age.10sq + cov.education + cov.female,   
                          data = nigeria, p = p, p1 = p1, p0 = p0, 
                          design = "forced-known")
  
  rrX <- rr.q1.reg.obj1$x
  x <- cbind(1, nigeria[, c("rr.q1", "cov.asset.index", "cov.married", "cov.age.10",
                   "cov.age.10sq", "cov.education", "cov.female")])
  x <- as.matrix(x[complete.cases(x),])
  x <- x[, c(1, "cov.asset.index", "cov.married", "cov.age.10",
             "cov.age.10sq", "cov.education", "cov.female")]
  expect_equivalent(rrX, x)
})