cat("\nTests for 'PFDS (jmodelMult)'")

myEps <- .Machine$double.eps
# browser()
cat(getwd())

#load("JSM/data/aids.rda")
fitLME <- lme(sqrt(CD4) ~ bs(obstime, 4, Boundary.knots = c(0, 21.5)), random =~ 1 | ID, data = aids)
fitCOX <- coxph(Surv(start, stop, event) ~ drug, data = aids, x = TRUE)
control <- list(max.iter = 50, nknot = 5, SE.method = 'PFDS', tol.L = 1e-08, tol.P = 1e-04)

test_that(" basic PFDS jmodelMult test with for aids data model = 2, rho = 1 ", { 
  m_MULT <- jmodelMult(fitLME, fitCOX, aids, model = 2, rho = 1, timeVarY = 'obstime', control = control)
  expect_equal( mean(m_MULT$est.bi), 0.9982398, tolerance = (10 ^ 8) * myEps, scale = 1)
  expect_equal( mean(m_MULT$Vcov), 0.002179331, tolerance = (10 ^ 7) * myEps, scale = 1)
})

cat("\nTests for 'PFDS (jmodelTM)'")

fitLME <- lme(sqrt(CD4) ~ drug + obstime + I(obstime^2) + drug:obstime + drug:I(obstime^2), random = ~ 1 | ID, data = aids)
fitCOX <- coxph(Surv(start, stop, event) ~ drug, data = aids, x = TRUE)
control <- list(max.iter = 50, nknot = 3, SE.method = 'PFDS', tol.L = 1e-08, tol.P = 1e-04)

test_that(" basic PLFD jmodelTM test with for aids data model = 2, rho = 1 ", {
  m_TM <- jmodelTM(fitLME, fitCOX, aids, timeVarY = 'obstime', control = control, model = 2, rho = 1)
  expect_equal( mean(m_TM$est.bi), -0.0007730147, tolerance = (10 ^ 4) * myEps, scale = 1)
  expect_equal( mean (m_TM$Vcov), 0.0006784183, tolerance = (10 ^ 5) * myEps, scale = 1)
})

 
