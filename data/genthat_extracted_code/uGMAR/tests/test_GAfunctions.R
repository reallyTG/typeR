library(uGMAR)
context("functions used in the genetic algorithm")

params12 <- c(1.0, 0.9, 0.25, 4.5, 0.7, 3.0, 0.8)
params22t <- c(1.4, 0.8, 0.05, 0.27, 3.5, 0.9, -0.18, 3.1, 0.7, 203, 3) # StMAR
params23 <- c(2.7, 0.8, -0.06, 0.3, 3.5, 0.8, -0.07, 2.6, 7.2, 0.3, -0.01, 0.1, 0.6, 0.25)

params12tr <- c(0.8, 0.96, 0.9, 0.4, 5.8, 0.9, 4, 272) # StMAR
params23r <- c(1.7, 1.9, 2.1, 0.8, -0.05, 0.3, 0.7, 4.5, 0.7, 0.2)
params23tr <-  c(1.9, 1.6, 2.1, 0.8, -0.02, 0.4, 0.1, 3.9, 0.6, 0.3, 15, 200, 220) # StMAR

R1 <- matrix(c(1, 0, 0, 0, 0, 1), ncol=2)
R2 <- diag(1, ncol=3, nrow=3)
R3 <- matrix(c(0.5, 0.5), ncol=1)
R4 <- diag(1, ncol=2, nrow=2)

params21c <- c(1, 0.9, 1, 3) # R3, StMAR
params22c <- c(1, 0.1, -0.1, 1, 2, 0.2, 2, 0.8, 11, 12) # R4, R3, StMAR
params33c <- c(1, 0.1, 0.1, 0.1, 1, 2, 0.2, 0.2, 0.2, 2, 3, 0.3, -0.3, 3, 0.5, 0.4) # R2, R2, R1

params21cr <- c(1, 1, 1) # R3 bound
params22cr <- c(1, 2, 0.8, 1, 2, 0.7, 11, 12) # R3, StMAR
params32cr <- c(1, 2, 0.3, -0.3, 1, 2, 0.6) # R1

params22gs <- c(1, 0.1, 0.1, 1, 2, 0.2, 0.2, 2, 0.3, 10) # M1=1, M2=1
params23gsr <- c(1, 2, 3, 0.5, 0.05, 1, 2, 3, 0.4, 0.4, 20, 30) # M1=1, M2=2

test_that("extractRegime extracts the right regime", {
  expect_equal(extractRegime(2, c(1, 2), params23gsr, model="G-StMAR", restricted=TRUE, regime=1), c(1, 1))
  expect_equal(extractRegime(2, c(1, 2), params23gsr, model="G-StMAR", restricted=TRUE, regime=3), c(3, 3, 30))
  expect_equal(extractRegime(2, c(1, 1), params22gs, model="G-StMAR", regime=2), c(2, 0.2, 0.2, 2, 10))
  expect_equal(extractRegime(2, c(1, 1), params22gs, model="G-StMAR", regime=1), c(1, 0.1, 0.1, 1))

  expect_equal(extractRegime(1, 2, params12, regime=1), c(1.00, 0.90, 0.25))
  expect_equal(extractRegime(2, 2, params22t, model="StMAR", regime=2), c(3.50, 0.90, -0.18, 3.10, 3.00))
  expect_equal(extractRegime(2, 3, params23, regime=3), c(7.20, 0.30, -0.01, 0.10))
  expect_equal(extractRegime(1, 2, params12tr, model="StMAR", restricted=TRUE, regime=2), c(0.96, 5.80, 272.00))
  expect_equal(extractRegime(2, 3, params23r,  restricted=TRUE, regime=2), c(1.9, 0.7))
  expect_equal(extractRegime(2, 3, params23tr, model="StMAR", restricted=TRUE, regime=3), c(2.1, 3.9, 220.0))

  expect_equal(extractRegime(2, 1, params21c, model="StMAR", constraints=list(R3), regime=1), c(1.0, 0.9, 1.0, 3.0))
  expect_equal(extractRegime(2, 2, params22c, model="StMAR", constraints=list(R4, R3), regime=2), c(2.0, 0.2, 2.0, 12))
  expect_equal(extractRegime(3, 3, params33c, constraints=list(R2, R2, R1), regime=2), c(2.0, 0.2, 0.2, 0.2, 2.0))
  expect_equal(extractRegime(3, 3, params33c, constraints=list(R2, R2, R1), regime=3), c(3.0, 0.3, -0.3, 3.0))
  expect_equal(extractRegime(2, 1, params21cr, restricted=TRUE, constraints=R3, regime=1), c(1, 1))
  expect_equal(extractRegime(2, 2, params22cr, model="StMAR", restricted=TRUE, constraints=R3, regime=1), c(1, 1, 11))
  expect_equal(extractRegime(2, 2, params22cr, model="StMAR", restricted=TRUE, constraints=R3, regime=2), c(2, 2, 12))
  expect_equal(extractRegime(3, 2, params32cr, restricted=TRUE, constraints=R1, regime=1), c(1, 1))
  expect_equal(extractRegime(3, 2, params32cr, restricted=TRUE, constraints=R1, regime=2), c(2, 2))
})

params12 <- c(1.0, 0.9, 0.25, 4.5, 0.7, 3.0, 0.8)
params22t <- c(1.4, 0.8, 0.05, 0.27, 3.5, 0.9, -0.18, 3.1, 0.7, 203, 3) # StMAR
params23 <- c(2.7, 0.8, -0.06, 0.3, 3.5, 0.8, -0.07, 2.6, 7.2, 0.3, -0.01, 0.1, 0.6, 0.25)

params12tr <- c(0.8, 0.96, 0.9, 0.4, 5.8, 0.9, 4, 272) # StMAR
params23r <- c(1.7, 1.9, 2.1, 0.8, -0.05, 0.3, 0.7, 4.5, 0.7, 0.2)
params23tr <-  c(1.9, 1.6, 2.1, 0.8, -0.02, 0.4, 0.1, 3.9, 0.6, 0.3, 15, 200, 220) # StMAR

R1 <- matrix(c(1, 0, 0, 0, 0, 1), ncol=2)
R2 <- diag(1, ncol=3, nrow=3)
R3 <- matrix(c(0.5, 0.5), ncol=1)
R4 <- diag(1, ncol=2, nrow=2)

params21c <- c(1, 0.9, 1, 3) # R3, StMAR
params22c <- c(1, 0.1, -0.1, 1, 2, 0.2, 2, 0.8, 11, 12) # R4, R3, StMAR
params33c <- c(1, 0.1, 0.1, 0.1, 1, 2, 0.2, 0.2, 0.2, 2, 3, 0.3, -0.3, 3, 0.5, 0.4) # R2, R2, R1

params21cr <- c(1, 1, 1) # R3 bound
params22cr <- c(1, 2, 0.8, 1, 2, 0.7, 11, 12) # R3, StMAR
params32cr <- c(1, 2, 0.3, -0.3, 1, 2, 0.6) # R1

params22gs <- c(1, 0.1, 0.1, 1, 2, 0.2, 0.2, 2, 0.3, 10) # M1=1, M2=1
params23gsr <- c(1, 2, 3, 0.5, 0.05, 1, 2, 3, 0.4, 0.4, 20, 30) # M1=1, M2=2

test_that("changeRegime changes the right regime correctly", {
  expect_equal(changeRegime(2, c(1, 2), params23gsr, model="G-StMAR", restricted=TRUE, regimeParams=c(7, 7, 70), regime=3), c(1, 2, 7, 0.5, 0.05, 1, 2, 7, 0.4, 0.4, 20, 70))
  expect_equal(changeRegime(2, c(1, 2), params23gsr, model="G-StMAR", restricted=TRUE, regimeParams=c(7, 7), regime=1), c(7, 2, 3, 0.5, 0.05, 7, 2, 3, 0.4, 0.4, 20, 30))
  expect_equal(changeRegime(2, c(1, 1), params22gs, model="G-StMAR", regimeParams=c(3, 0.3, 0.3, 3, 30), regime=2), c(1, 0.1, 0.1, 1, 3, 0.3, 0.3, 3, 0.3, 30))
  expect_equal(changeRegime(2, c(1, 1), params22gs, model="G-StMAR", regimeParams=c(3, 0.3, 0.3, 3), regime=1), c(3, 0.3, 0.3, 3, 2, 0.2, 0.2, 2, 0.3, 10))

  expect_equal(changeRegime(1, 2, params12, regimeParams=c(99, 98, 97), regime=1), c(99.0, 98.0, 97.0, 4.5, 0.7, 3.0, 0.8))
  expect_equal(changeRegime(2, 2, params22t, model="StMAR", regimeParams=c(9, 8, 7, 6, 5), regime=2), c(1.4, 0.8, 0.05, 0.27, 9, 8, 7, 6, 0.7, 203, 5))
  expect_equal(changeRegime(2, 3, params23, regimeParams=c(9, 8, 7, 6), regime=3), c(2.7, 0.8, -0.06, 0.3, 3.5, 0.8, -0.07, 2.6, 9, 8, 7, 6, 0.6, 0.25))
  expect_equal(changeRegime(1, 2, params12tr, model="StMAR", restricted=TRUE, regimeParams=c(9, 8, 7), regime=2), c(0.8, 9, 0.9, 0.4, 8, 0.9, 4, 7))
  expect_equal(changeRegime(2, 3, params23r,  restricted=TRUE, regimeParams=c(11, 12), regime=2), c(1.7, 11, 2.1, 0.8, -0.05, 0.3, 12, 4.5, 0.7, 0.2))
  expect_equal(changeRegime(2, 3, params23tr, model="StMAR", restricted=TRUE, regimeParams=c(99, 88, 77), regime=3), c(1.9, 1.6, 99, 0.8, -0.02, 0.4, 0.1, 88, 0.6, 0.3, 15, 200, 77))

  expect_equal(changeRegime(2, 1, params21c, model="StMAR", constraints=list(R3), regimeParams=c(9, 8, 7, 6), regime=1), c(9, 8, 7, 6))
  expect_equal(changeRegime(2, 2, params22c, model="StMAR", constraints=list(R4, R3), regimeParams=c(9, 8, 7, 6), regime=2), c(1, 0.1, -0.1, 1, 9, 8, 7, 0.8, 11, 6))
  expect_equal(changeRegime(3, 3, params33c, constraints=list(R2, R2, R1), regimeParams=c(9, 8, 7, 6), regime=3), c(1, 0.1, 0.1, 0.1, 1, 2, 0.2, 0.2, 0.2, 2, 9, 8, 7, 6, 0.5, 0.4))
  expect_equal(changeRegime(2, 1, params21cr, restricted=TRUE, constraints=R3, regimeParams=c(9, 8), regime=1), c(9, 1, 8))
  expect_equal(changeRegime(2, 2, params22cr, model="StMAR", restricted=TRUE, constraints=R3, regimeParams=c(9, 8, 7), regime=1), c(9, 2, 0.8, 8, 2, 0.7, 7, 12))
  expect_equal(changeRegime(3, 2, params32cr, restricted=TRUE, constraints=R1, regimeParams=c(9, 8), regime=2), c(1, 9, 0.3, -0.3, 1, 8, 0.6))
})
