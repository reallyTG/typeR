context("valmeta 3. frequentist meta-analysis of total OE ratio")
skip_on_cran()


library(metafor)
data(EuroSCORE)


test_that("Test whether Using the data argument yields the same results", {
  
  # valmeta using O and E
  fit1 <- valmeta(measure="OE", O=n.events, E=e.events, data=EuroSCORE)     
  fit2 <- with(EuroSCORE, valmeta(measure="OE", O=n.events, E=e.events))
  expect_equal(fit1$numstudies, fit2$numstudies)
  expect_equal(fit1$est, fit2$est)
  expect_equal(fit1$ci.lb, fit2$ci.lb)
  expect_equal(fit1$ci.ub, fit2$ci.ub)
  expect_equal(fit1$pi.lb, fit2$pi.lb)
  expect_equal(fit1$pi.ub, fit2$pi.ub)
  
  # valmeta using O, E and N
  fit3 <- valmeta(measure="OE", O=n.events, E=e.events, N=n,data=EuroSCORE)
  fit4 <- with(EuroSCORE, valmeta(measure="OE", O=n.events, E=e.events, N=n))
  expect_equal(fit3$numstudies, fit4$numstudies)
  expect_equal(fit3$est, fit4$est)
  expect_equal(fit3$ci.lb, fit4$ci.lb)
  expect_equal(fit3$ci.ub, fit4$ci.ub)
  expect_equal(fit3$pi.lb, fit4$pi.lb)
  expect_equal(fit3$pi.ub, fit4$pi.ub)
  
  # valmeta using Po, Pe and N
  fit5 <- valmeta(measure="OE", Po=Po, Pe=Pe, N=n, data=EuroSCORE)
  fit6 <- with(EuroSCORE, valmeta(measure="OE", Po=Po, Pe=Pe, N=n))
  expect_equal(fit5$numstudies, fit6$numstudies)
  expect_equal(fit5$est, fit6$est)
  expect_equal(fit5$ci.lb, fit6$ci.lb)
  expect_equal(fit5$ci.ub, fit6$ci.ub)
  expect_equal(fit5$pi.lb, fit6$pi.lb)
  expect_equal(fit5$pi.ub, fit6$pi.ub)
  
})

test_that("Test whether changing the parameters works", {
  
  fit.model <- "poisson/log"
  fit <- with(EuroSCORE, valmeta(measure="OE", O=n.events, E=e.events, method="ML",
                                 pars=list(model.oe=fit.model)))
  
  expect_equal(fit$model, fit.model)
  
  fit.model <- "normal/identity"
  fit <- with(EuroSCORE, valmeta(measure="OE", O=n.events, E=e.events,
                                 pars=list(model.oe=fit.model)))
  
  expect_equal(fit$model, fit.model)
})