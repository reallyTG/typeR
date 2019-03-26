context("valmeta 0. calculation of c-statistic")
skip_on_cran()

data(EuroSCORE)

test_that("Transformation of the c-statistic", {
  
  # Logit transformation
  logitc1 <- log(EuroSCORE$c.index/(1-EuroSCORE$c.index))
  logitc2 <- logit(EuroSCORE$c.index) #built-in function
  logitc3 <- (ccalc(cstat=c.index, cstat.se=se.c.index, data=EuroSCORE, g="log(cstat/(1-cstat))"))$theta
  expect_equal(logitc1, logitc2, logitc3)
  
  # Back-transformation
  ilogitc1 <- 1/(1+exp(-logitc1))
  ilogitc2 <- inv.logit(logitc2)
  expect_equal(ilogitc1, ilogitc2)

  # Arcsine square root transformed proportion
  ft1 <- asin(sqrt(EuroSCORE$c.index))
  ft2 <- (ccalc(cstat=c.index, cstat.se=se.c.index, data=EuroSCORE, g="asin(sqrt(cstat))"))$theta
  expect_equal(ft1, ft2)
  
})

test_that("Standard error of transformed c-statistic", {
  
  # Logit transformation
  logitcse1 <- EuroSCORE$se.c.index/(EuroSCORE$c.index*(1-EuroSCORE$c.index))
  logitcse2 <- (ccalc(cstat=c.index, cstat.se=se.c.index, data=EuroSCORE, g="log(cstat/(1-cstat))"))$theta.se
  expect_equal(logitcse1, logitcse2)
  
})



