context("EOSregress")

test_that("EOSvar stops with unknown variables", {
  expect_error(EOSvar("TX", T=25, P=1), "can't find a variable named TX")
  # why can't the test find these?
  #TX <- 2
  #expect_error(EOSvar("TX", T=25, P=1), "an object named TX is not a function")
  #TX <- function(T) 2
  #expect_error(EOSvar("TX", T=25, P=1), "the arguments of TX\\(\\) are not T, P")
})

test_that("regressions return known HKF parameters (neutral species)", { 
  # regress computed values of heat capacity and volume of CH4(aq)
  # calculated from HKF parameters on a T-P grid
  T <- convert(seq(0, 350, 25), "K")
  P <- seq(200, 1000, 100)
  # convert=FALSE means that temperature has units of K
  CH4.prop <- subcrt("CH4", T=T, P=P, grid="T", convert=FALSE)$out[[1]]
  # terms in the HKF equations for Cp
  Cp.var <- c("invTTheta2", "TXBorn")
  # get coefficients in Cp regression
  Cp.lm <- EOSregress(CH4.prop[, c("T", "P", "Cp")], Cp.var)
  Cp.coeff <- Cp.lm$coefficients
  # terms in the HKF equations for V
  V.var <- c("invPPsi", "invTTheta", "invPPsiTTheta", "QBorn")
  # get coefficients in V regression
  V.lm <- EOSregress(CH4.prop[, c("T", "P", "V")], V.var)
  # use same units as HKF: convert from cm3.bar to calories (divide by 41.84)
  V.coeff <- convert(V.lm$coefficients, "calories")
  ## the tests: did we get the HKF parameters that are in the database?
  CH4.par <- info(info("CH4"))
  # c1 and c2
  expect_equivalent(Cp.coeff[1], CH4.par$c1)
  expect_equivalent(Cp.coeff[2], CH4.par$c2)
  # omega (from Cp)
  expect_equivalent(Cp.coeff[3], CH4.par$omega)
  # a1, a2, a3 and a4
  expect_equivalent(V.coeff[1], CH4.par$a1)
  expect_equivalent(V.coeff[2], CH4.par$a2)
  expect_equivalent(V.coeff[3], CH4.par$a3)
  expect_equivalent(V.coeff[4], CH4.par$a4)
  # omega (from V)
  expect_equivalent(V.coeff[5], CH4.par$omega)
})
