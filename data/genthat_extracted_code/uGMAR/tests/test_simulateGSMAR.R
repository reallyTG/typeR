library(uGMAR)
context("simulate GSMAR")

params12 <- c(0.8, 0.5, 0.5, 0.3, 0.7, 0.1, 0.6, 10, 12) # StMAR
params23 <- c(1, 0.1, 0.1, 0.1, 2, -0.2, -0.2, 0.2, 3, 0.3, 0.3, 0.3, 0.6, 0.3)
params13gs <- c(0, 0.9, 1, -1, 0.5, 0.8, 1, -0.5, 0.5, 0.3, 0.4, 5, 7) # M1=1, M2=2
stmar12 <- GSMAR(p=1, M=2, params=params12, model="StMAR", parametrization="mean")
gmar23 <- GSMAR(p=2, M=3, params=params23, model="GMAR")
gstmar13 <- GSMAR(p=1, M=c(1, 2), params=params13gs, model="G-StMAR")
set.seed(1); data12 <- simulateGSMAR(stmar12, nsimu=3)
set.seed(2); data23 <- simulateGSMAR(gmar23, nsimu=1)
set.seed(3); data23init <- simulateGSMAR(gmar23, nsimu=2, initvalues=c(1, 1.2))
set.seed(1); data13gs <- simulateGSMAR(gstmar13, nsimu=3)
sample12 <- data12$sample
component12 <- data12$component
sample23 <- data23$sample
component23 <- data23$component
weights23 <- data23$mixingWeights
sample23init <- data23init$sample

test_that("simulateGSMAR simulates correctly from non-restricted process", {
  expect_equal(sample12[3], 1.859932, tolerance=1e-6)
  expect_equal(component12, c(2, 1, 1))
  expect_equal(sample23, 1.017869, tolerance=1e-6)
  expect_equal(component23, 2)
  expect_equal(weights23[,2], 0.2067762, tolerance=1e-6)
  expect_equal(sample23init[2], 1.351309, tolerance=1e-6)
  expect_equal(data13gs$sample[1], -0.3833485, tolerance=1e-6)
  expect_equal(data13gs$mixingWeights[3,3], 0.00969763, tolerance=1e-6)
})

params12r <- c(1, 2, -0.9, 1, 2, 0.7)
params23r <- c(-0.1, -0.2, -0.3, -0.2, 0.5, 0.1, 0.2, 0.3, 0.5, 0.3, 3, 14, 50) # StMAR
params22gsr <- c(1, 1.2, 0.3, 0.3, 1, 1.2, 0.5, 6)
gmar12r <- GSMAR(p=1, M=2, params=params12r, model="GMAR", restricted=TRUE)
stmar23r <- GSMAR(p=2, M=3, params=params23r, model="StMAR", restricted=TRUE)
gstmar22r <- GSMAR(p=2, M=c(1, 1), params=params22gsr, model="G-StMAR", restricted=TRUE)
set.seed(1); data12r <- simulateGSMAR(gmar12r, nsimu=1)
set.seed(2); data12rinit <- simulateGSMAR(gmar12r, nsimu=2, initvalues=1)
set.seed(3); data23r <- simulateGSMAR(stmar23r, nsimu=2)
set.seed(1); data22gsr <- simulateGSMAR(gstmar22r, nsimu=2)
sample12r <- data12r$sample
component12r <- data12r$component
weights12r <- data12r$mixingWeights
sample12init <- data12rinit$sample
sample23r <- data23r$sample
component23r <- data23r$component

test_that("simulateGSMAR simulates correctly from restricted process", {
  expect_equal(sample12r, 1.018146, tolerance=1e-6)
  expect_equal(component12r, 2)
  expect_equal(weights12r[,1],  0.7716839, tolerance=1e-6)
  expect_equal(sample12init[1], 0.6312408, tolerance=1e-6)
  expect_equal(sample23r[2], -0.5006049, tolerance=1e-6)
  expect_equal(component23r[2], 2)
  expect_equal(data22gsr$sample[2], 2.583507, tolerance=1e-6)
  expect_equal(data22gsr$component[1], 2)
})

R1 <- matrix(c(1, 0, 0, 0, 0, 1), ncol=2)
R3 <- matrix(c(0.5, 0.5), ncol=1)
R4 <- diag(1, ncol=2, nrow=2)
params22c <- c(1, 0.1, -0.1, 1, 2, 0.2, 2, 0.8, 11, 12) # R4, R3, StMAR
params32cr <- c(1, 2, 0.3, -0.3, 1, 2, 0.6) # R1
params22gsrc <- c(0, 0, -0.99, 1, 1.2, 0.3, 10) # M1=1, M2=1, R3
stmar22c <- GSMAR(p=2, M=2, params=params22c, model="StMAR", constraints=list(R4, R3))
gmar32cr <- GSMAR(p=3, M=2, params=params32cr, model="GMAR", restricted=TRUE, constraints=R1)
gstmar22cr <- GSMAR(p=2, M=c(1, 1), params=params22gsrc, model="G-StMAR", restricted=TRUE, constraints=R3)
set.seed(1); data22c <- simulateGSMAR(stmar22c, nsimu=1)
set.seed(2); data32cr <- simulateGSMAR(gmar32cr, nsimu=2)
set.seed(3); data22gsrc <- simulateGSMAR(gstmar22cr, nsimu=2)
sample22c <- data22c$sample
weights22c <- data22c$mixingWeights
sample32cr <- data32cr$sample
component32cr <- data32cr$component

test_that("simulateGSMAR simulates correctly from constrained process", {
  expect_equal(sample22c,  0.1681538, tolerance=1e-6)
  expect_equal(weights22c[,1], 0.8956446, tolerance=1e-6)
  expect_equal(sample32cr[2], 0.7406432, tolerance=1e-6)
  expect_equal(component32cr[2], 1)
  expect_equal(data22gsrc$sample[2], -1.732949, tolerance=1e-6)
  expect_equal(data22gsrc$component[1], 2)
  expect_equal(data22gsrc$mixingWeights[,1], c(0.3122889, 0.3084366), tolerance=1e-6)
})
