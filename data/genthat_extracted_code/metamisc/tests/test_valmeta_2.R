context("valmeta 2. frequentist meta-analysis of c-statistic")
skip_on_cran()


library(metafor)
data(EuroSCORE)


test_that("Fixed effect meta-analysis of c-statistic works", {
  
  ## Prepare data
  dat.cstat <- ccalc(cstat=c.index, cstat.se=se.c.index, 
                     cstat.cilb=c.index.95CIl, cstat.ciub=c.index.95CIu, 
                     N=n, O=n.events, slab=Study, data=EuroSCORE, 
                     g="log(cstat/(1-cstat))")
  
  fit1.metafor <- rma(yi=theta, sei=theta.se, method="FE", data=dat.cstat, test="z")
  
  fit1.valmeta <- with(EuroSCORE, valmeta(cstat=c.index, cstat.se=se.c.index, 
                                          cstat.cilb = c.index.95CIl, cstat.ciub = c.index.95CIu,
                                          N=n, O=n.events, slab=Study, method="FE", test="z"))
  
  # Now try the same but omit study labels
  fit2.valmeta <- with(EuroSCORE, valmeta(cstat=c.index, cstat.se=se.c.index, 
                                          cstat.cilb = c.index.95CIl, cstat.ciub = c.index.95CIu,
                                          N=n, O=n.events, method="FE", test="z"))
  
  expect_equal(fit1.valmeta$est, fit2.valmeta$est, inv.logit(as.numeric(fit1.metafor$beta)))
  
})

test_that("Test whether Using the data argument yields the same results", {
  
  # Valmeta using cstat, se.cstat, N, and O
  fit1 <- valmeta(measure="cstat", cstat=c.index, cstat.se=se.c.index, N=n, O=n.events, slab=Study, data=EuroSCORE)
  fit2 <- with(EuroSCORE, valmeta(measure="cstat", cstat=c.index, cstat.se=se.c.index, N=n, O=n.events, slab=Study))
  expect_equal(fit1$numstudies, fit2$numstudies)
  expect_equal(fit1$est, fit2$est)
  expect_equal(fit1$ci.lb, fit2$ci.lb)
  expect_equal(fit1$ci.ub, fit2$ci.ub)
  expect_equal(fit1$pi.lb, fit2$pi.lb)
  expect_equal(fit1$pi.ub, fit2$pi.ub)
  
  fit3 <- valmeta(cstat=c.index,  N=n, O=n.events, slab=Study, data=EuroSCORE)
  fit4 <- with(EuroSCORE, valmeta(cstat=c.index,  N=n, O=n.events, slab=Study))
  expect_equal(fit3$numstudies, fit2$numstudies)
  expect_equal(fit3$est, fit4$est)
  expect_equal(fit3$ci.lb, fit4$ci.lb)
  expect_equal(fit3$ci.ub, fit4$ci.ub)
  expect_equal(fit3$pi.lb, fit4$pi.lb)
  expect_equal(fit3$pi.ub, fit4$pi.ub)
  
})



# Nearly identical results when we need to estimate the SE
#' with(EuroSCORE, valmeta(cstat=c.index,  N=n, O=n.events, slab=Study))
#' 
#' 