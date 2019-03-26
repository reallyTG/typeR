library(uGMAR)
context("loglikelihood and mixing weights")

params12 <- c(1.0, 0.9, 0.25, 4.5, 0.7, 3.0, 0.8)
params12t <- c(1.1, 0.9, 0.3, 4.5, 0.7, 3.2, 0.8, 5, 8) # StMAR
params22 <- c(1.2, 0.8, 0.05, 0.3, 3.5, 0.8, -0.1, 2.8, 0.8)
params22t <- c(1.4, 0.8, 0.05, 0.27, 3.5, 0.9, -0.18, 3.1, 0.7, 203, 3) # StMAR
params23 <- c(2.7, 0.8, -0.06, 0.3, 3.5, 0.8, -0.07, 2.6, 7.2, 0.3, -0.01, 0.1, 0.6, 0.25)
params12bound <- c(0.4, 0.4, 0.4, 0.6, 0.6, 0.6, 0.0)
params22bound <- c(1, 1, 0.1, 1, 2, 0.2, 0.2, 0.2, 0.7)

params12r <- c(1.4, 1.8, 0.9, 0.3, 3.3, 0.8)
params12tr <- c(0.8, 0.96, 0.9, 0.4, 5.8, 0.9, 4, 272) # StMAR
params23r <- c(1.7, 1.9, 2.1, 0.8, -0.05, 0.3, 0.7, 4.5, 0.7, 0.2)
params23tr <-  c(1.9, 1.6, 2.1, 0.8, -0.02, 0.4, 0.1, 3.9, 0.6, 0.3, 15, 200, 220) # StMAR
params12rbound <- c(1, 2, 0.2, -0.1, 0.6)
params13rbound <- c(0.1, 0.2, 0.3, 0.5, 0.1, 0.2, 0.3, 0.5, 0.5)

R1 <- matrix(c(1, 0, 0, 0, 0, 1), ncol=2)
R2 <- diag(1, ncol=3, nrow=3)
R3 <- matrix(c(0.5, 0.5), ncol=1)
R4 <- diag(1, ncol=2, nrow=2)

params32c <- c(1, 0.1, -0.1, 1, 2, 0.2, -0.2, 2, 0.6, 11, 12) # R1, R1, StMAR
params33c <- c(1, 0.1, 0.1, 0.1, 1, 2, 0.2, 0.2, 0.2, 2, 3, 0.3, -0.3, 3, 0.5, 0.4) # R2, R2, R1
params21c <- c(1, 0.9, 1, 3) # R3, StMAR
params22c <- c(1, 0.1, -0.1, 1, 2, 0.2, 2, 0.8, 11, 12) # R4, R3, StMAR
params22c_2 <- c(1.2, 0.8, 0.05, 0.3, 3.5, 0.8, -0.1, 2.8, 0.8) # R4, R4 (should be same as non-constrained)

params21cr <- c(1, 1, 1) # R3 bound
params22cr <- c(1, 2, 0.8, 1, 2, 0.7, 11, 12) # R3, StMAR
params32cr <- c(1, 2, 0.3, -0.3, 1, 2, 0.6) # R1
params23cr <- c(1.7, 1.9, 2.1, 0.8, -0.05, 0.3, 0.7, 4.5, 0.7, 0.2) # R4 (should be same as non-constrained)

params12gs <- c(1.2, 0.8, 0.6, 1.3, 0.6, 1.1, 0.6, 3)
params23gs <- c(1, 0.1, 0.1, 1, 1.2, 0.2, 0.2, 1.2, 1.3, 0.3, -0.3, 1.3, 0.3, 0.4, 11, 12) # M1=1, M2=2
params13gsr <- c(1.3, 2.2, 1.4, 0.8, 2.4, 4.6, 0.4, 0.25, 0.15, 20) # M1=2, M2=1

params12gs2 <- c(1.5, 0.8, 1.5, 2.9, 0.8, 1.1, 0.6, 3) # M1=1, M2=1
params13gsr2 <- c(1.3, 1, 1.4, 0.8, 0.4, 2, 0.2, 0.25, 0.15, 20) # M1=2, M2=1

params32gsc <- c(1, 0.1, 0.1, 1, 2, 0.2, 0.2, 0.2, 2, 0.6, 10) # M1=1, M2=1, R1, R2
params22gsrc <- c(1, 2, 0.5, 1, 2, 0.5, 10) # M1=1, M2=1, R3

test_that("Loglikelihood gives correct value for non-restricted models", {
  expect_equal(loglikelihood_int(VIX, 1, 2, params12, model="GMAR", constraints=NULL), -307.5011, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 1, 2, params12, conditional=FALSE, model="GMAR"), -310.944, tolerance=1e-3)
  expect_equal(loglikelihood_int(5*VIX[10:50], 1, 2, params12, conditional=FALSE, model="GMAR"), -1965.026, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX[100:102], 1, 2, params12, model="GMAR"), -1.276816, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 1, 2, params12t, model="StMAR"), -282.7787, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 1, 2, params12t, model="StMAR"), -282.7787, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 2, 2, params22, model="GMAR"), -389.3221, tolerance=1e-3)
  expect_equal(loglikelihood_int(log(VIX), 2, 2, params22, model="GMAR"), -684.4247, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX[10:20], 2, 2, params22, conditional=FALSE, model="GMAR"), -18.44737, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 2, 2, params22t, conditional=FALSE, model="StMAR"), -308.9636, tolerance=1e-3)
  expect_equal(loglikelihood_int(-10*VIX, 2, 2, params22t, model="StMAR"), -1297.336, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 2, 3, params23, model="GMAR"), -329.4227, tolerance=1e-3)
  expect_equal(loglikelihood_int(5*VIX, 2, 3, params23, model="GMAR"), -10192.5, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX[1:4], 2, 3, params23, conditional=FALSE, model="GMAR"), -8.210192, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 1, 2, params12bound, boundaries=TRUE, model="GMAR", minval=-9999), -9999)
  expect_equal(loglikelihood_int(VIX, 2, 2, params22bound, boundaries=TRUE, model="GMAR", minval=-9999), -9999)
  expect_equal(loglikelihood_int(VIX, 1, c(1, 1), params12gs, model="G-StMAR", conditional=FALSE), -677.1648, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 2, c(1, 2), params23gs, model="G-StMAR"), -981.8043, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 1, c(1, 1), params12gs2, model="G-StMAR"), -366.1986, tolerance=1e-3)
})


test_that("Loglikelihood gives correct value for resticted models", {
  expect_equal(loglikelihood_int(VIX, 1, 2, params12r, restricted=TRUE, model="GMAR"), -310.2204, tolerance=1e-3)
  expect_equal(loglikelihood_int(log(VIX), 1, 2, params12r, restricted=TRUE, conditional=FALSE, model="GMAR"), -482.5679, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX[13:16], 1, 2, params12r, restricted=TRUE, conditional=FALSE, model="GMAR"), -4.759725, tolerance=1e-3)
  expect_equal(loglikelihood_int(7*VIX, 1, 2, params12r, restricted=TRUE, conditional=FALSE, model="GMAR"), -4061.793, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 1, 2, params12tr, model="StMAR", restricted=TRUE), -380.6129, tolerance=1e-3)
  expect_equal(loglikelihood_int(log(VIX), 1, 2, params12tr, model="StMAR", restricted=TRUE, conditional=FALSE), -402.2318, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 2, 3, params23r, restricted=TRUE, model="GMAR"), -462.2798, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX[1:5], 2, 3, params23r, restricted=TRUE, conditional=FALSE, model="GMAR"), -14.15429, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 2, 3, params23r, restricted=TRUE, conditional=FALSE, model="GMAR"), -470.8897, tolerance=1e-3)
  expect_equal(loglikelihood_int(10*VIX[100:150], 2, 3, params23r, restricted=TRUE, conditional=FALSE, model="GMAR"), -5231.426, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 2, 3, params23tr, model="StMAR", restricted=TRUE, conditional=FALSE), -412.6474, tolerance=1e-3)
  expect_equal(loglikelihood_int(3*VIX, 2, 3, params23tr, model="StMAR", restricted=TRUE), -955.0699, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 1, 2, params12rbound, restricted=TRUE, boundaries=TRUE, model="GMAR", minval=-9999), -9999)
  expect_equal(loglikelihood_int(VIX, 1, 3, params13rbound, restricted=TRUE, boundaries=TRUE, model="GMAR", minval=-9999), -9999)
  expect_equal(loglikelihood_int(VIX, 1, c(2, 1), params13gsr, model="G-StMAR", restricted=TRUE, conditional=FALSE), -448.9022, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 1, c(2, 1), params13gsr2, model="G-StMAR", restricted=TRUE), -515.032, tolerance=1e-3)
})


test_that("Loglikelihood gives correct value for constrained models", {
  expect_equal(loglikelihood_int(VIX, 3, c(1, 1), params32gsc, model="G-StMAR", constraints=list(R1, R2), conditional=FALSE), -668.9493, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 2, c(1, 1), params22gsrc, model="G-StMAR", restricted=TRUE, constraints=R3, conditional=FALSE), -784.8558, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 3, 2, params32c, model="StMAR", constraints=list(R1, R1), conditional=FALSE), -1312.314, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 3, 3, params33c, constraints=list(R2, R2, R1)), -977.7254, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 2, 1, params21c, model="StMAR", constraints=list(R3)), -315.6233, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 2, 2, params22c, model="StMAR", constraints=list(R4, R3)), -1098.969, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 2, 2, params22c_2, constraints=list(R4, R4)), -389.3221, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 2, 1, params21cr, restricted=TRUE, constraints=R3, boundaries=TRUE, minval=-9999), -9999)
  expect_equal(loglikelihood_int(VIX, 2, 2, params22cr, model="StMAR", restricted=TRUE, constraints=R3), -381.8174, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 3, 2, params32cr, restricted=TRUE, constraints=R1, conditional=FALSE), -7602.361, tolerance=1e-3)
  expect_equal(loglikelihood_int(VIX, 2, 3, params23cr, restricted=TRUE, constraints=R4), -462.2798, tolerance=1e-3)
})


test_that("mixingWeights gives correct weights for non-restricted models", {
  expect_equal(mixingWeights_int(VIX, 1, c(1, 1), params12gs2, model="G-StMAR")[10, 1], 0.1972129, tolerance=1e-3)
  expect_equal(mixingWeights_int(VIX, 1, c(1, 1), params12gs, model="G-StMAR")[10, 2], 0.9906132, tolerance=1e-3)
  expect_equal(mixingWeights_int(VIX, 2, c(1, 2), params23gs, model="G-StMAR")[20, 3], 0.2209903, tolerance=1e-3)
  expect_equal(mixingWeights_int(VIX, 1, 2, params12, model="GMAR")[2, 1], 0.0007360931, tolerance=1e-6)
  expect_equal(mixingWeights_int(VIX, 1, 2, params12t, model="StMAR")[20, 2], 0.14159, tolerance=1e-5)
  expect_equal(mixingWeights_int(VIX, 2, 2, params22t, model="StMAR")[1, 1], 1.742628e-07, tolerance=1e-6)
  expect_equal(mixingWeights_int(VIX, 2, 3, params23, model="GMAR")[13, 1], 0.2983124, tolerance=1e-6)
})

test_that("mixingWeights gives correct weights for restricted models", {
  expect_equal(mixingWeights_int(VIX, 1, c(2, 1), params13gsr2, model="G-StMAR", restricted=TRUE)[20, 2], 0.9989134, tolerance=1e-3)
  expect_equal(mixingWeights_int(VIX, 1, c(2, 1), params13gsr, model="G-StMAR", restricted=TRUE)[40, 1], 0.1064519, tolerance=1e-3)
  expect_equal(mixingWeights_int(VIX, 1, 2, params12r, model="GMAR", restricted=TRUE)[100, 1], 0.9360905, tolerance=1e-6)
  expect_equal(mixingWeights_int(VIX, 1, 2, params12tr, model="StMAR", restricted=TRUE)[1, 2], 0.9091443, tolerance=1e-6)
  expect_equal(mixingWeights_int(VIX, 2, 3, params23r, model="GMAR", restricted=TRUE)[13, 2], 0.009593899, tolerance=1e-6)
  expect_equal(mixingWeights_int(VIX, 2, 3, params23tr, model="GMAR", restricted=TRUE)[111, 2], 1.090888e-22, tolerance=1e-6)
})

test_that("mixingWeights gives correct weights for constrained models", {
  expect_equal(mixingWeights_int(VIX, 3, c(1, 1), params32gsc, model="G-StMAR", constraints=list(R1, R2))[1, 2], 1, tolerance=1e-3)
  expect_equal(mixingWeights_int(VIX, 2, c(1, 1), params22gsrc, model="G-StMAR", restricted=TRUE, constraints=R3)[1, 2], 1, tolerance=1e-3)
  expect_equal(mixingWeights_int(VIX, 3, 2, params32c, model="StMAR", constraints=list(R1, R1))[1, 1], 0.01096221, tolerance=1e-6)
  expect_equal(mixingWeights_int(VIX, 3, 3, params33c, model="GMAR", constraints=list(R2, R2, R1))[113, 3], 0.0001194389, tolerance=1e-6)
  expect_equal(mixingWeights_int(VIX, 2, 1, params21c, model="StMAR", constraints=list(R3))[200, 1], 1, tolerance=1e-6)
  expect_equal(mixingWeights_int(VIX, 2, 2, params22c, model="StMAR", constraints=list(R4, R3))[2, 2], 0.956518, tolerance=1e-6)
  expect_equal(mixingWeights_int(VIX, 2, 2, params22cr, model="StMAR", restricted=TRUE, constraints=R3)[1, 2], 0.9994679, tolerance=1e-6)
  expect_equal(mixingWeights_int(VIX, 3, 2, params32cr, model="GMAR", restricted=TRUE, constraints=R1)[100, 1], 1.07196e-29, tolerance=1e-6)
})
