library(uGMAR)
context("argument checks")

test_that("checkAndCorrectData gives correct answer", {
  # expect_true(is.matrix(checkAndCorrectData(ts(VIX, start=c(2000, 2), frequency=12), 1)))
  # expect_true(is.matrix(checkAndCorrectData(as.vector(VIX), 4)))
  # expect_true(ncol(checkAndCorrectData(as.vector(VIX), 2))==1 & nrow(checkAndCorrectData(as.vector(VIX), 2))==length(as.vector(VIX)))
  # expect_true(ncol(checkAndCorrectData(t(VIX), 2))==1)
  checkAndCorrectData(as.matrix(VIX), 1)
  expect_error(checkAndCorrectData(VIX[1:3], 4))
  expect_error(checkAndCorrectData(c(VIX, NA, 1), 1))
  expect_error(checkAndCorrectData(cbind(VIX, VIX), 3))
})

params11 = c(1, 0.1, 1, 2)
params12 = c(1, 0.5, 1, 2, -0.5, 2, 0.7)
params22 = c(1, 0.99, -0.001, 1, 2, 0.8, 0.2, 0.4, 0.6, 3, 12)
params12_2 = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.6)
params22gs = c(1, 0.1, 0.1, 1, 2, 0.2, 0.2, 0.2, 10) # M1=1, M2=1
params13gs = c(1, 0.1, 1, 2, 0.2, 2, 3, 0.3, 3, 0.2, 0.5, 2, 3) # M1=1, M2=2

test_that("parameterChecks throws errors correctly", {
  expect_error(parameterChecks(1, 1, params11, pars=as.matrix(params11[1:3]), alphas=1, model="StMAR"))
  expect_error(parameterChecks(1, 1, params11, pars=as.matrix(params11[1:3]), alphas=1, model="GMAR"))
  expect_error(parameterChecks(1, 3, params12, pars=matrix(params12[1:6], ncol=2), alphas=c(0.7, 0.3)))
  expect_error(parameterChecks(1, 2, params12, pars=matrix(params12[1:6], ncol=2), alphas=c(1, 0.00001)))
  expect_error(parameterChecks(1, 2, params12, pars=matrix(params12[1:6], ncol=2), alphas=c(0.7, 0.3), model="StMAR"))
  expect_error(parameterChecks(2, 2, params22, pars=matrix(params22[1:8], ncol=2), alphas=c(0.6, 0.4)))
  expect_error(parameterChecks(2, 2, params22, pars=matrix(params22[1:8], ncol=2), alphas=c(0.6, 0.4), model="StMAR"))
#  expect_error(parameterChecks(1, 2, params12_2, pars=matrix(params12_2[1:6], ncol=2), alphas=c(0.6, 0.4))) # identification
  expect_error(parameterChecks(2, c(1,1), params22gs, pars=matrix(params22gs, ncol=2), alphas=c(0.3, 0.7), model="G-StMAR"))
  expect_error(parameterChecks(1, c(1,2), params13gs, pars=matrix(params13gs[1:9], ncol=3), alphas=c(0.2, 0.5, 0.3), model="G-StMAR"))
})

R1 = diag(1, ncol=3, nrow=3)
R2 = matrix(c(1, 0, 0, 1, 0, 0), ncol=2)
R3 = matrix(c(1, 0, 0.5, 0.3, 0, 1), ncol=3)
R4 = as.matrix(1)

test_that("checkConstraintMat throws errors correctly", {
  expect_error(checkConstraintMat(2, 2, constraints=list(R1, R2)))
  expect_error(checkConstraintMat(3, 2, constraints=list(R1, R1, R1)))
  expect_error(checkConstraintMat(2, 2, constraints=R2))
  expect_error(checkConstraintMat(2, 2, constraints=list(R3, R3)))
  expect_error(checkConstraintMat(3, 1, constraints=list(R2)))
  expect_error(checkConstraintMat(3, 1, constraints=list(as.vector(R3))))

  expect_error(checkConstraintMat(2, 3, constraints=R1, restricted=TRUE))
  expect_error(checkConstraintMat(3, 1, constraints=R2, restricted=TRUE))
  expect_error(checkConstraintMat(2, 2, constraints=R3, restricted=TRUE))
  expect_error(checkConstraintMat(3, 3, constraints=R3, restricted=TRUE))
  expect_error(checkConstraintMat(3, 3, constraints=as.vector(R4), restricted=TRUE))
})

test_that("checkPM throws errors correctly", {
  expect_error(checkPM(-1, 1))
  expect_error(checkPM(1, 0))
  expect_error(checkPM(10.2, 2))
  expect_error(checkPM(2, -2))
  expect_error(checkPM(1, 1.1))
  expect_error(checkPM(1, 1, model="G-StMAR"))
  expect_error(checkPM(1, c(0, 2), model="G-StMAR"))
  expect_error(checkPM(1, c(2, 0), model="G-StMAR"))
  expect_error(checkPM(2, c(1.5, 2), model="G-StMAR"))
})


params12t <- c(1.1, 0.9, 0.3, 4.5, 0.7, 3.2, 0.8, 5, 8) # StMAR
params23 <- c(2.7, 0.8, -0.06, 0.3, 3.5, 0.8, -0.07, 2.6, 7.2, 0.3, -0.01, 0.1, 0.6, 0.25)
params12tr <- c(0.8, 0.96, 0.9, 0.4, 5.8, 0.9, 4, 272) # StMAR
params23r <- c(1.7, 1.9, 2.1, 0.8, -0.05, 0.3, 0.7, 4.5, 0.7, 0.2)

R1 <- matrix(c(1, 0, 0, 0, 0, 1), ncol=2)
R2 <- diag(1, ncol=3, nrow=3)
R3 <- matrix(c(0.5, 0.5), ncol=1)
R4 <- diag(1, ncol=2, nrow=2)

params32c <- c(1, 0.1, -0.1, 1, 2, 0.2, -0.2, 2, 0.6, 11, 12) # R1, R1, StMAR
params33c <- c(1, 0.1, 0.1, 0.1, 1, 2, 0.2, 0.2, 0.2, 2, 3, 0.3, -0.3, 3, 0.5, 0.4) # R2, R2, R1
params21c <- c(1, 0.9, 1, 3) # R3, StMAR
params23gs <- c(1, 0.1, 0.1, 1, 2, 0.2, 0.2, 2, 3, 0.3, 0.3, 3, 0.4, 0.4, 3, 4) # M1=1, M2=2
params32gsc <- c(1, 0.1, 0.1, 1, 2, 0.2, 0.2, 0.2, 2, 0.6, 10) # M1=1, M2=1, R1, R2
params23gsc <- c(1, 0.1, 1, 2, 0.2, 2, 3, 0.3, 0.3, 3, 0.3, 0.4, 20, 30) # M1=1, M2=2, R3, R3, R4

params21cr <- c(1, 1, 1) # R3 bound
params22cr <- c(1, 2, 0.8, 1, 2, 0.7, 11, 12) # R3, StMAR
params22gsr <- c(1, 2, 0.1, 0.1, 1, 2, 0.3, 3) # M1=1, M2=1
params22gsrc <- c(1, 2, 0.5, 1, 2, 0.5, 10) # M1=1, M2=1, R3

test_that("nParams works correctly", {
  expect_equal(nParams(1, 2, model="StMAR"), length(params12t))
  expect_equal(nParams(2, 3), length(params23))
  expect_equal(nParams(1, 2, model="StMAR", restricted=TRUE), length(params12tr))
  expect_equal(nParams(2, 3, restricted=TRUE), length(params23r))
  expect_equal(nParams(3, 2, model="StMAR", constraints=list(R1, R1)), length(params32c))
  expect_equal(nParams(3, 3, constraints=list(R2, R2, R1)), length(params33c))
  expect_equal(nParams(2, 1, model="StMAR", constraints=list(R3)), length(params21c))
  expect_equal(nParams(2, 1, restricted=TRUE, constraints=R3), length(params21cr))
  expect_equal(nParams(2, 2, model="StMAR", restricted=TRUE, constraints=R3), length(params22cr))
  expect_equal(nParams(2, c(1, 2), model="G-StMAR"), length(params23gs))
  expect_equal(nParams(2, c(1, 1), model="G-StMAR", restricted=TRUE), length(params22gsr))
  expect_equal(nParams(3, c(1, 1), model="G-StMAR", constraints=list(R1, R2)), length(params32gsc))
  expect_equal(nParams(2, c(1, 2), model="G-StMAR", constraints=list(R3, R3, R4)), length(params23gsc))
  expect_equal(nParams(2, c(1, 1), model="G-StMAR", restricted=TRUE, constraints=R3), length(params22gsrc))
})


test_that("all_pos_ints works correctly", {
  expect_true(all_pos_ints(c(1, 2, 3)))
  expect_true(all_pos_ints(1))
  expect_true(all_pos_ints(list(1, 3, 100)))

  expect_false(all_pos_ints(c(1, 2, 0)))
  expect_false(all_pos_ints(-1))
  expect_false(all_pos_ints(0.1))
  expect_false(all_pos_ints(1.1))
  expect_false(all_pos_ints(list(1, 2, 3, 0.1)))
})

test_that("check_model works correctly", {
  expect_error(check_model("GStMAR"))
  expect_error(check_model("gmar"))
})



test_that("check_gsmar works correctly", {
  check_gsmar(structure(list(1), class="gsmar")) # no error
  expect_error(check_gsmar(list(1)))
})
