cat("\nTests for 'PLFD (jmodelMult)'")

myEps <- .Machine$double.eps
 
fitLME <- lme(sqrt(CD4) ~ bs(obstime, 4, Boundary.knots = c(0, 21.5)), random =~ 1 | ID, data = aids)
fitCOX <- coxph(Surv(start, stop, event) ~ drug, data = aids, x = TRUE)
control <- list(max.iter = 50, nknot = 5, SE.method = 'PLFD', tol.L = 1e-08, tol.P = 1e-04)

# We use increased tolerances as this procedure is very susceptible to numeric noise. 

test_that(" basic PLFD jmodelMult test with for aids data model = 2, rho = 1 ", { 
  m_MULT <- jmodelMult(fitLME, fitCOX, aids, model = 2, rho = 1, timeVarY = 'obstime', control = control)
  expect_equal( mean(m_MULT$est.bi), 0.9982398, tolerance = (10 ^ 8) * myEps, scale = 1)
  expect_equal( mean(m_MULT$Vcov), 0.000413898, tolerance = (10 ^ 6) * myEps, scale = 1)
})

 cat("\nTests for 'PLFD (jmodelTM)'")

fitLME <- lme(sqrt(CD4) ~ drug + obstime + I(obstime^2) + drug:obstime + drug:I(obstime^2), random = ~ 1 | ID, data = aids)
fitCOX <- coxph(Surv(start, stop, event) ~ drug, data = aids, x = TRUE)
control <- list(max.iter = 50, nknot = 3, SE.method = 'PLFD', tol.L = 1e-08, tol.P = 1e-04)

test_that(" basic PLFD jmodelTM test with for aids data model = 2, rho = 1 ", {
  m_TM <- jmodelTM(fitLME, fitCOX, aids, timeVarY = 'obstime', control= control, model = 2, rho = 1)
  expect_equal( mean(m_TM$est.bi), -0.0007730147, tolerance = (10 ^ 4) * myEps, scale = 1)
  expect_equal( mean(m_TM$Vcov), 0.0006846624, tolerance = (10 ^ 6) * myEps, scale = 1)
})


