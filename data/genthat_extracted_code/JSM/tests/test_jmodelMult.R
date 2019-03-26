cat("\nTests for 'jmodelMult'")

myEps <- .Machine$double.eps
 
fitLME <- lme(sqrt(CD4) ~ bs(obstime, 4, Boundary.knots = c(0, 21.5)), random =~ 1 | ID, data = aids)
fitCOX <- coxph(Surv(start, stop, event) ~ drug, data = aids, x = TRUE)
control <- list( max.iter = 50, nknot = 3, tol.L = 1e-08, tol.P = 1e-04)

test_that(" basic jmodelMult test with for aids data model = 1, rho = 1 ", { 
  m_MULT <- jmodelMult(fitLME, fitCOX, aids, model = 1, rho = 1, timeVarY = 'obstime', control = control)
  expect_equal( m_MULT$coefficients$lgLik, -2543.368, tolerance = (10 ^ 12) * myEps, scale = 1)
  expect_equal( mean(m_MULT$coefficients$lamb$bashaz), 0.0906141, tolerance = (10 ^ 7) * myEps, scale = 1)
})

test_that(" basic jmodelMult test with for aids data model = 2, rho = 1 ", { 
  m_MULT <- jmodelMult(fitLME, fitCOX, aids, model = 2, rho = 1, timeVarY = 'obstime', control = control)
  expect_equal( m_MULT$coefficients$lgLik, -2542.776, tolerance = (10 ^ 12) * myEps, scale = 1)
  expect_equal( mean(m_MULT$coefficients$lamb$bashaz), 0.1073857, tolerance = (10 ^ 9) * myEps, scale = 1)
})
