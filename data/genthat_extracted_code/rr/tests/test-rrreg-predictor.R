context("Tests regression code (rrreg.predictor)")

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
  
  set.seed(3)
  rr.q1.reg.obj1 <- rrreg(rr.q1 ~ cov.asset.index + cov.married + 
                            cov.age.10 + cov.age.10sq + cov.education + cov.female,   
                          data = nigeria, p = p, p1 = p1, p0 = p0, 
                          design = "forced-known")
  
  summary(rr.q1.reg.obj1)
  
  ### rrreg.predictor ### Aside from the usual fitted probabilities error warning, it's good
  set.seed(3)  
  rr.q1.pred.obj1 <- rrreg.predictor(civic ~ cov.asset.index + cov.married + cov.age.10 + I(cov.age.10^2) + 
                                       cov.education + cov.female + rr.q1, 
                                     rr.item = "rr.q1", parstart = FALSE, estconv = TRUE,
                                     data = nigeria, verbose = FALSE, 
                                     p = p, p1 = p1, p0 = p0, design = "forced-known")
  
  print(rr.q1.pred.obj1)
  summary(rr.q1.pred.obj1)
  coef(rr.q1.pred.obj1)
  vcov(rr.q1.pred.obj1)
  
  
  #fit.sens
  set.seed(3)
  rr.q1.pred.obj2 <- 
    rrreg.predictor(civic ~ cov.asset.index + cov.married + cov.age.10 + I(cov.age.10^2) + 
                      cov.education + cov.female + rr.q1, 
                    rr.item = "rr.q1", parstart = FALSE, estconv = TRUE,
                    data = nigeria, verbose = FALSE, fit.sens = "glm",
                    p = p, p1 = p1, p0 = p0, design = "forced-known")
  
  print(rr.q1.pred.obj2)
  summary(rr.q1.pred.obj2)
  coef(rr.q1.pred.obj2)
  vcov(rr.q1.pred.obj2)
  
  #fit.outcome
  set.seed(3)
  rr.q1.pred.obj3 <- 
    rrreg.predictor(civic ~ cov.asset.index + cov.married + cov.age.10 + I(cov.age.10^2) + 
                      cov.education + cov.female + rr.q1, 
                    rr.item = "rr.q1", parstart = FALSE, estconv = TRUE,
                    data = nigeria, verbose = FALSE, fit.outcome = "glm",
                    p = p, p1 = p1, p0 = p0, design = "forced-known")
  
  print(rr.q1.pred.obj3)
  summary(rr.q1.pred.obj3)
  coef(rr.q1.pred.obj3)
  vcov(rr.q1.pred.obj3)
  
  #bstart / parstart = FALSE
  set.seed(3)
  rr.q1.pred.obj4 <- 
    rrreg.predictor(civic ~ cov.asset.index + cov.married + cov.age.10 + I(cov.age.10^2) + 
                      cov.education + cov.female + rr.q1, 
                    rr.item = "rr.q1", parstart = FALSE, estconv = TRUE,
                    data = nigeria, verbose = FALSE, bstart = coef(rr.q1.reg.obj1),
                    p = p, p1 = p1, p0 = p0, design = "forced-known")
  
  #tstart
  set.seed(3)
  rr.q1.pred.obj5 <- 
    rrreg.predictor(civic ~ cov.asset.index + cov.married + cov.age.10 + I(cov.age.10^2) + 
                      cov.education + cov.female + rr.q1, 
                    rr.item = "rr.q1", parstart = FALSE, estconv = TRUE,
                    data = nigeria, verbose = FALSE, tstart =c(coef(rr.q1.reg.obj1), .02),
                    p = p, p1 = p1, p0 = p0, design = "forced-known")
  
  #parstart
  set.seed(1)
  rr.q1.pred.obj6 <- 
    rrreg.predictor(civic ~ cov.asset.index + cov.married + cov.age.10 + I(cov.age.10^2) + 
                      cov.education + cov.female + rr.q1, 
                    rr.item = "rr.q1", parstart = TRUE, estconv = TRUE,
                    data = nigeria, verbose = FALSE, 
                    p = p, p1 = p1, p0 = p0, design = "forced-known") 
  
  #maxIter
  set.seed(3)
  rr.q1.pred.obj7 <- 
    rrreg.predictor(civic ~ cov.asset.index + cov.married + cov.age.10 + I(cov.age.10^2) + 
                      cov.education + cov.female + rr.q1, 
                    rr.item = "rr.q1", parstart = FALSE, estconv = TRUE,
                    data = nigeria, verbose = FALSE, maxIter = 10500, 
                    p = p, p1 = p1, p0 = p0, design = "forced-known")
  
  summary(rr.q1.pred.obj7)
  print(rr.q1.pred.obj7)
  
  #verbose
  set.seed(3)
  rr.q1.pred.obj8 <- 
    rrreg.predictor(civic ~ cov.asset.index + cov.married + cov.age.10 + I(cov.age.10^2) + 
                      cov.education + cov.female + rr.q1, 
                    rr.item = "rr.q1", parstart = FALSE, estconv = TRUE,
                    data = nigeria, verbose = TRUE, 
                    p = p, p1 = p1, p0 = p0, design = "forced-known")
  
  #optim
  set.seed(3)
  rr.q1.pred.obj9 <- 
    rrreg.predictor(civic ~ cov.asset.index + cov.married + cov.age.10 + I(cov.age.10^2) + 
                      cov.education + cov.female + rr.q1, 
                    rr.item = "rr.q1", parstart = FALSE, estconv = TRUE,
                    data = nigeria, verbose = FALSE, optim = TRUE, 
                    p = p, p1 = p1, p0 = p0, design = "forced-known")
  
  #em.converge
  set.seed(3)
  rr.q1.pred.obj10 <- 
    rrreg.predictor(civic ~ cov.asset.index + cov.married + cov.age.10 + I(cov.age.10^2) + 
                      cov.education + cov.female + rr.q1, 
                    rr.item = "rr.q1", parstart = FALSE, estconv = TRUE,
                    data = nigeria, verbose = FALSE, em.converge = 10^(-3),  
                    p = p, p1 = p1, p0 = p0, design = "forced-known")
  
  #glmMaxIter
  set.seed(3)
  rr.q1.pred.obj11 <- 
    rrreg.predictor(civic ~ cov.asset.index + cov.married + cov.age.10 + I(cov.age.10^2) + 
                      cov.education + cov.female + rr.q1, 
                    rr.item = "rr.q1", parstart = FALSE, estconv = TRUE,
                    data = nigeria, verbose = FALSE, glmMaxIter = 21000,  
                    p = p, p1 = p1, p0 = p0, design = "forced-known")
  
  #estconv
  set.seed(3)
  rr.q1.pred.obj12 <- 
    rrreg.predictor(civic ~ cov.asset.index + cov.married + cov.age.10 + I(cov.age.10^2) + 
                      cov.education + cov.female + rr.q1, 
                    rr.item = "rr.q1", parstart = FALSE, estconv = FALSE,
                    data = nigeria, verbose = FALSE,  
                    p = p, p1 = p1, p0 = p0, design = "forced-known")
  
  
  ### predict.rrreg.predictor ###
  rr.q1.pred.pred1 <- predict(rr.q1.pred.obj1, 
                              avg = TRUE, quasi.bayes = TRUE, 
                              n.sims = 10000)
  #alpha
  rr.q1.pred.pred2 <- predict(rr.q1.pred.obj1, alpha = .1, 
                              avg = TRUE, quasi.bayes = TRUE, 
                              n.sims = 10000)
  
  rr.q1.pred.pred1
  rr.q1.pred.pred2 #se's and CI's are different as they should be
  
  #n.sims
  rr.q1.pred.pred3 <- predict(rr.q1.pred.obj1,  
                              avg = TRUE, quasi.bayes = TRUE, 
                              n.sims = 10500)
  
  #avg
  rr.q1.pred.pred4 <- predict(rr.q1.pred.obj1,  
                              avg = FALSE, quasi.bayes = TRUE, 
                              n.sims = 10000)
  
  #newdata
  rr.q1.pred.pred5 <- predict(rr.q1.pred.obj1, newdata = nigeria,
                              avg = TRUE, quasi.bayes = TRUE, 
                              n.sims = 10000) #works, same est as pred1
  
  #newdata error message, works
  #predict(rr.q1.pred.obj1, newdata = NA,
  #                        avg = TRUE, quasi.bayes = TRUE, 
  #                        n.sims = 10000)
  
  #quasi.bayes
  rr.q1.pred.pred6 <- predict(rr.q1.pred.obj1, 
                              avg = TRUE, quasi.bayes = FALSE, 
                              n.sims = 10000)
  
  #fix.z as value
  rr.q1.pred.pred7 <- predict(rr.q1.pred.obj1, fix.z = .4,
                              avg = TRUE, quasi.bayes = TRUE, 
                              n.sims = 10000)
  
  #fix.z as vector
  rr.q1.pred.pred8 <- predict(rr.q1.pred.obj1, fix.z = rep(.4, nrow(rr.q1.pred.obj1$data)),
                              avg = TRUE, quasi.bayes = TRUE, 
                              n.sims = 10000)
  
  #fix.z as value, probability error
  #predict(rr.q1.pred.obj1, fix.z = 1.4,
  #        avg = TRUE, quasi.bayes = TRUE, 
  #        n.sims = 10000)
  
})

test_that("output from rrreg.predictor gives us unscaled data, x", {
  
  set.seed(3)  
  rr.q1.pred.obj1 <- rrreg.predictor(civic ~ cov.asset.index + cov.married + cov.age.10 + I(cov.age.10^2) + 
                                     cov.education + cov.female + rr.q1, 
                                     rr.item = "rr.q1", parstart = FALSE, estconv = TRUE,
                                     data = nigeria, verbose = FALSE, 
                                     p = p, p1 = p1, p0 = p0, design = "forced-known")
  
  rrpX <- rr.q1.pred.obj1$x
  x <- cbind(1, nigeria[, c("civic", "rr.q1", "cov.asset.index", "cov.married", "cov.age.10",
                            "cov.age.10sq", "cov.education", "cov.female")])
  x <- as.matrix(x[complete.cases(x),])
  x <- x[, c(1, "cov.asset.index", "cov.married", "cov.age.10",
             "cov.age.10sq", "cov.education", "cov.female")]
  expect_equivalent(rrpX, x)
})
